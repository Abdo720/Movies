import 'package:injectable/injectable.dart';
import 'package:movies/core/Api/api_constans.dart';
import 'package:movies/core/Api/api_manager.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Search/data/DataRecourses/remote/SearchRemoteDs.dart';

@Injectable(as: Searchremoteds)
class Searchremotedsimpl implements Searchremoteds {
  ApiManager _apiManager;

  Searchremotedsimpl(this._apiManager);

  @override
  Future<MoviesResponse> search(
    String word, {
    int page = 1,
    int limit = 50,
  }) async {
    try {
      var response = await _apiManager.get(
        ApiConstans.listMoviesEndPoints,
        queryParameters: {"query_term": word, "page": page, "limit": limit},
      );

      return MoviesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
