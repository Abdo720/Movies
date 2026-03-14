import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';
import 'package:movies/features/moviesDetails/domain/repository/GetDetailsRepo.dart';

abstract class GetMoviesDetailsDs {
  Future<MoviesDetailesResponse> getDetails(int id);
  Future<MovieSimilar> getSimilar(int id);
}
