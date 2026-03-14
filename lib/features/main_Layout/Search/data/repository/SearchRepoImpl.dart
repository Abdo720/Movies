import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Search/data/DataRecourses/remote/SearchRemoteDs.dart';
import 'package:movies/features/main_Layout/Search/domain/repository/SearchRepo.dart';

@Injectable(as: Searchrepo)
class Searchrepoimpl implements Searchrepo {
  Searchremoteds _searchremoteDs;

  Searchrepoimpl(this._searchremoteDs);

  @override
  Future<MoviesResponse> search(
    String word, {
    int page = 1,
    int limit = 50,
  }) async {
    try {
      var response = await _searchremoteDs.search(
        word,
        page: page,
        limit: limit,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
