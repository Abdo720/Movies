import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Home/domain/repository/getMoviesRepo.dart';

@injectable
class GetMoviesUseCase {
  final GetMoviesRepo _getMoviesRepo;

  GetMoviesUseCase(this._getMoviesRepo);

  Future<MoviesResponse> call(String genre, {int page = 1, int limit = 50}) {
    return _getMoviesRepo.getMovies(genre, page: page, limit: limit);
  }
}
