import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';

class BlocDetailsStates {
  RequstState? moviesDetailsState;

  MoviesDetailesResponse? moviesDetailesResponse;
  MovieSimilar? movieSimilar;

  String? errorMassage;

  bool isSaved;

  bool isHistorySaved;

  BlocDetailsStates({
    this.moviesDetailsState,
    this.moviesDetailesResponse,
    this.movieSimilar,
    this.errorMassage,
    this.isSaved = false,
    this.isHistorySaved = false,
  });

  BlocDetailsStates copyWith({
    RequstState? moviesDetailsState,
    MoviesDetailesResponse? moviesDetailesResponse,
    MovieSimilar? movieSimilar,
    String? errorMassage,
    bool? isSaved,
    bool? isHistorySaved,
  }) {
    return BlocDetailsStates(
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailesResponse:
          moviesDetailesResponse ?? this.moviesDetailesResponse,
      movieSimilar: movieSimilar ?? this.movieSimilar,
      errorMassage: errorMassage ?? this.errorMassage,
      isSaved: isSaved ?? this.isSaved,
      isHistorySaved: isHistorySaved ?? this.isHistorySaved,
    );
  }
}
