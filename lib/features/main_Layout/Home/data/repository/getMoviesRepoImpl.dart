import 'package:injectable/injectable.dart';
import 'package:movies/core/net/internet_checker.dart';
import 'package:movies/features/main_Layout/Home/data/DataSources/local/GetMoviesLocalDs.dart';
import 'package:movies/features/main_Layout/Home/data/DataSources/remote/GetMoviesDs.dart';
import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Home/domain/repository/getMoviesRepo.dart';

@Injectable(as: GetMoviesRepo)
class GetMoviesRepoImpl implements GetMoviesRepo {
  final GetMoviesDs _remoteDs;
  final GetMoviesLocalDs _localDs;
  final InternetConnectivity _connectivity;

  GetMoviesRepoImpl(this._remoteDs, this._localDs, this._connectivity);

  @override
  Future<MoviesResponse> getMovies(
    String genre, {
    int page = 1,
    int limit = 50,
  }) async {
    if (_connectivity.isConnected) {
      final response = await _remoteDs.getMovies(
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
      final cached = await _localDs.getMovies(genre, page: page, limit: limit);
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
