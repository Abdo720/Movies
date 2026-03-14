import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/moviesDetails/data/DataResourcse/local/GetMoviesDetailsLocalDs.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movie_details_hive_mapper.dart';
import 'package:movies/features/moviesDetails/data/models/movie_details_hive_model.dart';

@Injectable(as: GetMoviesDetailsLocalDs)
class GetMoviesDetailsLocalDsImpl implements GetMoviesDetailsLocalDs {
  static const String _boxName = 'movie_details';

  Future<Box<MovieDetailsHiveModel>> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<MovieDetailsHiveModel>(_boxName);
    }
    return Hive.box<MovieDetailsHiveModel>(_boxName);
  }

  @override
  Future<Movie?> getDetails(int id) async {
    final box = await _openBox();
    final cached = box.get(id);
    return cached?.toMovie();
  }

  @override
  Future<void> saveDetails(Movie movie) async {
    final box = await _openBox();
    if (movie.id != null) {
      await box.put(movie.id, movie.toHive());
    }
  }
}
