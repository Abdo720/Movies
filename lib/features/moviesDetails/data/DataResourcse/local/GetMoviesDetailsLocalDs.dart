import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';

abstract class GetMoviesDetailsLocalDs {
  Future<Movie?> getDetails(int id);
  Future<void> saveDetails(Movie movie);
}
