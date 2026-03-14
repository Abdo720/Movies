import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/constans_manager.dart';
import 'package:movies/features/moviesDetails/data/FireBaseFouctions/FireBaseFounctions.dart';
import 'package:movies/features/moviesDetails/data/models/MovieModel.dart';
import 'package:movies/features/moviesDetails/data/models/MoviesDetailesResponse.dart';
import 'package:movies/features/moviesDetails/data/models/movieSimilar.dart';
import 'package:movies/features/moviesDetails/domain/UseCase/GetDetailsUseCse.dart';
import 'package:movies/features/moviesDetails/domain/UseCase/GetSimilarUseCase.dart';

import 'MoviesDetailsEvents.dart';
import 'MoviesDetailsState.dart';

@injectable
class Moviesdetailsbloc extends Bloc<BlocDetailsEvents, BlocDetailsStates> {
  final GetDetailsUseCase _getDetailsUseCse;
  final GetSimilarUseCase _getSimilarUseCase;

  Moviesdetailsbloc(this._getDetailsUseCse, this._getSimilarUseCase)
    : super(BlocDetailsStates()) {
    /// GET MOVIE DETAILS
    on<GetMovieDetailsEvent>((event, emit) async {
      emit(state.copyWith(moviesDetailsState: RequstState.loading));

      try {
        final results = await Future.wait<dynamic>([
          _getDetailsUseCse.call(event.id),
          _getSimilarUseCase.call(event.id),
        ]);

        final MoviesDetailesResponse details =
            results[0] as MoviesDetailesResponse;

        final MovieSimilar similar = results[1] as MovieSimilar;

        bool saved = false;

        final user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          var query = await FirebaseFunctions.getMoviesCollection()
              .where("id", isEqualTo: event.id)
              .where("user_id", isEqualTo: user.uid)
              .get();

          if (query.docs.isNotEmpty) {
            saved = true;
          }
        }

        emit(
          state.copyWith(
            moviesDetailsState: RequstState.succes,
            moviesDetailesResponse: details,
            movieSimilar: similar,
            isSaved: saved,
          ),
        );

        /// بعد ما الداتا تيجي ضيف الفيلم في history
        add(AddMovieToHistoryEvent());
      } catch (e) {
        emit(
          state.copyWith(
            moviesDetailsState: RequstState.failure,
            errorMassage: e.toString(),
          ),
        );
      }
    });

    /// ADD MOVIE TO HISTORY
    on<AddMovieToHistoryEvent>((event, emit) async {
      final movie = state.moviesDetailesResponse?.data?.movie;

      if (movie == null) return;

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return;

      var collection = FirebaseFunctions.getHistoryCollection();

      var query = await collection
          .where("id", isEqualTo: movie.id)
          .where("user_id", isEqualTo: user.uid)
          .get();

      /// علشان مايتكررش
      if (query.docs.isNotEmpty) return;

      final movieModel = MovieModel(
        id: movie.id,
        movieId: "",
        url: movie.url,
        title: movie.title,
        rating: movie.rating,
        mediumCoverImage: movie.mediumCoverImage,
        userId: user.uid,
      );

      await FirebaseFunctions.addToHistory(movieModel);

      emit(state.copyWith(isHistorySaved: true));
    });

    /// FAVORITE
    on<ToggleSaveMovieEvent>((event, emit) async {
      final movie = state.moviesDetailesResponse?.data?.movie;

      if (movie == null) return;

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return;

      if (!state.isSaved) {
        final movieModel = MovieModel(
          id: movie.id,
          movieId: "",
          url: movie.url,
          title: movie.title,
          rating: movie.rating,
          mediumCoverImage: movie.mediumCoverImage,
          userId: user.uid,
        );

        await FirebaseFunctions.createFavMovie(movieModel);
      } else {
        var collection = FirebaseFunctions.getMoviesCollection();

        var query = await collection
            .where("id", isEqualTo: movie.id)
            .where("user_id", isEqualTo: user.uid)
            .get();

        for (var doc in query.docs) {
          await doc.reference.delete();
        }
      }

      emit(state.copyWith(isSaved: !state.isSaved));
    });
  }
}
