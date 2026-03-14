import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Browse/data/dataSources/local/GetMoviesBrawserLocalDs.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Home/data/models/movie_hive_mapper.dart';
import 'package:movies/features/main_Layout/Home/data/models/movie_hive_model.dart';

@Injectable(as: GetMoviesBrawserLocalDs)
class GetMoviesBrawserLocalDsImpl implements GetMoviesBrawserLocalDs {
  static String _boxName(String genre, int page) =>
      'brawser_${genre.toLowerCase()}_page$page';

  static const String _metaBoxName = 'brawser_meta';

  @override
  Future<List<Movies>> getMoviesBrawser(
    String genre, {
    int page = 1,
    int limit = 50,
  }) async {
    final boxName = _boxName(genre, page);
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<MovieHiveModel>(boxName);
    }
    final box = Hive.box<MovieHiveModel>(boxName);
    return box.values.map((e) => e.toMovie()).toList();
  }

  @override
  Future<void> saveMovies(String genre, int page, List<Movies> movies) async {
    final boxName = _boxName(genre, page);
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<MovieHiveModel>(boxName);
    }
    final box = Hive.box<MovieHiveModel>(boxName);
    await box.clear();
    await box.addAll(movies.map((m) => m.toHive()).toList());

    if (!Hive.isBoxOpen(_metaBoxName)) {
      await Hive.openBox(_metaBoxName);
    }
    await Hive.box(_metaBoxName).put(genre.toLowerCase(), true);
  }

  @override
  Future<bool> hasCache(String genre) async {
    if (!Hive.isBoxOpen(_metaBoxName)) {
      await Hive.openBox(_metaBoxName);
    }
    return Hive.box(_metaBoxName).get(genre.toLowerCase(), defaultValue: false)
        as bool;
  }

  @override
  Future<void> clearCache(String genre) async {
    if (!Hive.isBoxOpen(_metaBoxName)) {
      await Hive.openBox(_metaBoxName);
    }
    await Hive.box(_metaBoxName).delete(genre.toLowerCase());
  }
}
