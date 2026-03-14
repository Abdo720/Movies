import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Search/domain/repository/SearchRepo.dart';

@injectable
class Searchusecase {
  Searchrepo _searchrepo;

  Searchusecase(this._searchrepo);

  Future<MoviesResponse> call(String word, {int page = 1, int limit = 50}) {
    return _searchrepo.search(word, page: page, limit: limit);
  }
}
