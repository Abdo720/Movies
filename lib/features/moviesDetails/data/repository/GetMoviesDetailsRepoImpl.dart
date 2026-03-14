import 'package:injectable/injectable.dart';
import 'package:movies/core/net/internet_checker.dart';
import 'package:movies/features/moviesDetails/data/DataResourcse/local/GetMoviesDetailsLocalDs.dart';
import 'package:movies/features/moviesDetails/data/DataResourcse/remote/getMoviesDetailsDs.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart'
    hide Data;
import 'package:movies/features/moviesDetails/domain/repository/GetDetailsRepo.dart';

@Injectable(as: GetDetailsRepo)
class Getmoviesdetailsrepoimpl implements GetDetailsRepo {
  final GetMoviesDetailsDs _remoteDs;
  final GetMoviesDetailsLocalDs _localDs;
  final InternetConnectivity _connectivity;

  Getmoviesdetailsrepoimpl(this._remoteDs, this._localDs, this._connectivity);

  @override
  Future<MoviesDetailesResponse> getDetails(int id) async {
    if (_connectivity.isConnected) {
      final response = await _remoteDs.getDetails(id);
      final movie = response.data?.movie;
      if (movie != null) {
        await _localDs.saveDetails(movie);
      }
      return response;
    } else {
      final cached = await _localDs.getDetails(id);
      if (cached == null) {
        throw Exception('No internet connection and no cached data available.');
      }
      return MoviesDetailesResponse(
        status: 'ok',
        statusMessage: 'cached',
        data: Data(movie: cached),
      );
    }
  }

  @override
  Future<MovieSimilar> getSimilar(int id) async {
    // Similar مش محتاج cache — لو مفيش نت نرجع قايمة فاضية
    if (!_connectivity.isConnected) {
      return MovieSimilar(status: 'ok', data: null);
    }
    return await _remoteDs.getSimilar(id);
  }
}
