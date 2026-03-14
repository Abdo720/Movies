import 'package:injectable/injectable.dart';
import 'package:movies/core/Api/api_constans.dart';
import 'package:movies/core/Api/api_manager.dart';
import 'package:movies/features/main_Layout/Browse/data/dataSources/remote/getMoviesBrawserDs.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

@Injectable(as: GetMoviesBrawserDs)
class Getmoviesbrawserdsimpl implements GetMoviesBrawserDs {
  final ApiManager _apiManager;

  Getmoviesbrawserdsimpl(this._apiManager);

  @override
  Future<MoviesResponse> getMoviesBrawser(
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
