import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';

abstract class GetDetailsRepo {
  Future<MoviesDetailesResponse> getDetails(int id);
  Future<MovieSimilar> getSimilar(int id);
}
