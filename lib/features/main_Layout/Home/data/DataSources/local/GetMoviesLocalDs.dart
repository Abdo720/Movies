import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

abstract class GetMoviesLocalDs {
  Future<List<Movies>> getMovies(String genre, {int page = 1, int limit = 50});
  Future<void> saveMovies(String genre, int page, List<Movies> movies);
  Future<bool> hasCache(String genre);
  Future<void> clearCache(String genre);
}
