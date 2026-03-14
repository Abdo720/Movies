import 'package:injectable/injectable.dart';
import 'package:movies/core/Api/api_constans.dart';
import 'package:movies/core/Api/api_manager.dart';
import 'package:movies/features/main_Layout/Home/data/DataSources/remote/GetMoviesDs.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

@Injectable(as: GetMoviesDs)
class GetMoviesDsImpl implements GetMoviesDs {
  final ApiManager _apiManager;

  GetMoviesDsImpl(this._apiManager);

  @override
  Future<MoviesResponse> getMovies(
    String genre, {
    int page = 1,
    int limit = 50,
  }) async {
    try {
      final response = await _apiManager.get(
        ApiConstans.listMoviesEndPoints,
        queryParameters: {"genre": genre, "page": page, "limit": limit},
      );

      return MoviesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
