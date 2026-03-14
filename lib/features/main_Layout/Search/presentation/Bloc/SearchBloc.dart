import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/features/main_Layout/Search/domain/UseCases/SearchUseCase.dart';
import 'package:movies/features/main_Layout/Search/presentation/Bloc/SearchEvents.dart'
    hide Searchusecase;
import 'package:movies/features/main_Layout/Search/presentation/Bloc/SearchStates.dart';

@injectable
class Searchbloc extends Bloc<BlocSearchEvents, BlocSearchStates> {
  Searchusecase _searchusecase;

  Searchbloc(this._searchusecase) : super(BlocSearchStates()) {
    on<Searchevents>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(state.copyWith(searchRequstState: RequstState.loading));
        }

        var response = await _searchusecase.call(event.word, page: event.page);

        final movies = response.data?.movies ?? [];
        final isLastPage = movies.length < 50;

        emit(
          state.copyWith(
            searchRequstState: RequstState.succes,
            moviesResponse: response,
            currentPage: event.page,
            isLastPage: isLastPage,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            searchRequstState: RequstState.failure,
            errorMassage: e.toString(),
          ),
        );
      }
    });
  }
}
