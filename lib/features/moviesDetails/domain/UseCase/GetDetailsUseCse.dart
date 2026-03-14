import 'package:injectable/injectable.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/domain/repository/GetDetailsRepo.dart';

@injectable
class GetDetailsUseCase {
  GetDetailsRepo _getDetailsRepo;
  GetDetailsUseCase(this._getDetailsRepo);

  Future<MoviesDetailesResponse> call(int id) {
    return _getDetailsRepo.getDetails(id);
  }
}
