import 'package:injectable/injectable.dart';
import 'package:movies/features/main_Layout/Browse/domain/repository/getMoviesBrawserRepo.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

@injectable
class Getmoviesbrawserusecase {
  final Getmoviesbrawserrepo _getmoviesbrawserrepo;

  Getmoviesbrawserusecase(this._getmoviesbrawserrepo);

  Future<MoviesResponse> call(String genre, {int page = 1, int limit = 50}) {
    return _getmoviesbrawserrepo.getMoviesBrawser(
      genre,
      page: page,
      limit: limit,
    );
  }
}
