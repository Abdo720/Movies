import 'package:injectable/injectable.dart';
import 'package:movies/core/net/internet_checker.dart';
import 'package:movies/features/main_Layout/Browse/data/dataSources/local/GetMoviesBrawserLocalDs.dart';
import 'package:movies/features/main_Layout/Browse/data/dataSources/remote/getMoviesBrawserDs.dart';
import 'package:movies/features/main_Layout/Browse/domain/repository/getMoviesBrawserRepo.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

@Injectable(as: Getmoviesbrawserrepo)
class Getmoviesbrawserrepoimpl implements Getmoviesbrawserrepo {
  final GetMoviesBrawserDs _remoteDs;
  final GetMoviesBrawserLocalDs _localDs;
  final InternetConnectivity _connectivity;

  Getmoviesbrawserrepoimpl(this._remoteDs, this._localDs, this._connectivity);

  @override
  Future<MoviesResponse> getMoviesBrawser(
    String genre, {
    int page = 1,
    int limit = 50,
  }) async {
    if (_connectivity.isConnected) {
      final response = await _remoteDs.getMoviesBrawser(
        genre,
        page: page,
        limit: limit,
      );
      final movies = response.data?.movies ?? [];
      if (movies.isNotEmpty) {
        await _localDs.saveMovies(genre, page, movies);
      }
      return response;
    } else {
      final cached = await _localDs.getMoviesBrawser(
        genre,
        page: page,
        limit: limit,
      );
      if (cached.isEmpty) {
        throw Exception('No internet connection and no cached data available.');
      }
      return MoviesResponse(
        status: 'ok',
        statusMessage: 'cached',
        data: Data(
          movieCount: cached.length,
          limit: limit,
          pageNumber: page,
          movies: cached,
        ),
      );
    }
  }
}
