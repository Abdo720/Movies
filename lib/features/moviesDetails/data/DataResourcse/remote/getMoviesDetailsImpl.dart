import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/Api/api_constans.dart';
import 'package:movies/core/Api/api_manager.dart';
import 'package:movies/features/moviesDetails/data/DataResourcse/remote/getMoviesDetailsDs.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';

@Injectable(as: GetMoviesDetailsDs)
class Getmoviesdetailsimpl implements GetMoviesDetailsDs {
  final ApiManager _apiManager;
  Getmoviesdetailsimpl(this._apiManager);
  @override
  Future<MoviesDetailesResponse> getDetails(int id) async {
    try {
      final response = await _apiManager.get(
        ApiConstans.movieDetails,
        queryParameters: {
          "with_images": true,
          "with_cast": true,
          "movie_id": id,
        },
      );
      return MoviesDetailesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieSimilar> getSimilar(int id) async {
    try {
      final response = await _apiManager.get(
        ApiConstans.moviesSemiller,
        queryParameters: {"movie_id": id},
      );
      return MovieSimilar.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
