import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Home/domain/useCase/getMoviesUseCase.dart';
import 'package:movies/features/main_Layout/Home/presentation/Bloc/getMoviesEvent.dart';
import 'package:movies/features/main_Layout/Home/presentation/Bloc/getMoviesState.dart';

@injectable
class HomeBloc extends Bloc<BlocEvents, BlocState> {
  final GetMoviesUseCase _getMoviesUseCase;

  HomeBloc(this._getMoviesUseCase) : super(BlocState(genres: {})) {
    on<FetchMoviesPageEvent>(_onFetchMoviesPage);
  }

  Future<void> _onFetchMoviesPage(
    FetchMoviesPageEvent event,
    Emitter<BlocState> emit,
  ) async {
    final genreState =
        state.genres[event.genre] ??
        GenreMoviesState(movies: [], currentPage: 0);

    if (genreState.isLoading || genreState.isLastPage) return;

    emit(
      state.copyWith(
        genres: {
          ...state.genres,
          event.genre: genreState.copyWith(isLoading: true, error: null),
        },
      ),
    );

    try {
      final response = await _getMoviesUseCase.call(
        event.genre,
        page: event.page,
      );
      final newMovies = response.data?.movies ?? [];
      final limit = response.data?.limit ?? 50;
      final isLastPage = newMovies.length < limit;

      final updatedMovies = [...genreState.movies, ...newMovies];

      emit(
        state.copyWith(
          genres: {
            ...state.genres,
            event.genre: genreState.copyWith(
              movies: updatedMovies,
              newItems: newMovies,
              currentPage: event.page,
              isLastPage: isLastPage,
              isLoading: false,
              error: null,
            ),
          },
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          genres: {
            ...state.genres,
            event.genre: genreState.copyWith(
              isLoading: false,
              error: e.toString(),
            ),
          },
        ),
      );
    }
  }
}
