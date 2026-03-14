import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

class BlocSearchStates {
  RequstState? searchRequstState;
  MoviesResponse? moviesResponse;
  String? errorMassage;
  int currentPage;
  bool isLastPage;

  BlocSearchStates({
    this.searchRequstState = RequstState.init,
    this.moviesResponse,
    this.errorMassage,
    this.currentPage = 1,
    this.isLastPage = false,
  });

  BlocSearchStates copyWith({
    RequstState? searchRequstState,
    MoviesResponse? moviesResponse,
    String? errorMassage,
    int? currentPage,
    bool? isLastPage,
  }) {
    return BlocSearchStates(
      searchRequstState: searchRequstState ?? this.searchRequstState,
      moviesResponse: moviesResponse ?? this.moviesResponse,
      errorMassage: errorMassage ?? this.errorMassage,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}
