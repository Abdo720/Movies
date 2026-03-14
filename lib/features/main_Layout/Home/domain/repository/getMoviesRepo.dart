import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

abstract class GetMoviesRepo {
  Future<MoviesResponse> getMovies(
    String genre, {
    int page = 1,
    int limit = 50,
  });
}
