import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Browse/domain/useCase/getMoviesBrawserUseCase.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserEvents.dart';
import 'package:movies/features/main_Layout/Browse/presentation/Bloc/getMoviesBrawserState.dart';

@injectable
class BrawserBloc extends Bloc<BlocBrawserEvents, BlocBrawserState> {
  final Getmoviesbrawserusecase _getmoviesbrawserusecase;

  BrawserBloc(this._getmoviesbrawserusecase)
    : super(BlocBrawserState(genres: {})) {
    on<FetchMoviesBrawserPageEvent>(_onFetchBrawserMoviesPage);
    on<ResetGenreEvent>(_onResetGenre);
  }

  Future<void> _onFetchBrawserMoviesPage(
    FetchMoviesBrawserPageEvent event,
    Emitter<BlocBrawserState> emit,
  ) async {
    final genreState =
        state.genres[event.genre] ??
        GenreMoviesBraweserState(
          movies: [],
          currentPage: 0,
          isLastPage: false,
          isLoading: false,
        );

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
      final response = await _getmoviesbrawserusecase.call(
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
              movies: updatedMovies, // ALL movies accumulated
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

  Future<void> _onResetGenre(
    ResetGenreEvent event,
    Emitter<BlocBrawserState> emit,
  ) async {
    emit(
      state.copyWith(
        genres: {
          ...state.genres,
          event.genre: GenreMoviesBraweserState(
            movies: [],
            currentPage: 0,
            isLastPage: false,
            isLoading: false,
            error: null,
          ),
        },
      ),
    );
  }
}
