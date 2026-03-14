import 'package:injectable/injectable.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';
import 'package:movies/features/moviesDetails/domain/repository/GetDetailsRepo.dart';

@injectable
class GetSimilarUseCase {
  GetDetailsRepo _getDetailsRepo;
  GetSimilarUseCase(this._getDetailsRepo);
  Future<MovieSimilar> call(int id) {
    return _getDetailsRepo.getSimilar(id);
  }
}
