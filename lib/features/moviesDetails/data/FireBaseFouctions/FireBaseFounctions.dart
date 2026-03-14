import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/features/moviesDetails/data/models/MovieModel.dart';

class FirebaseFunctions {
  static CollectionReference<MovieModel> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection("Favorite")
        .withConverter<MovieModel>(
          fromFirestore: (snapshot, _) => MovieModel.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  static CollectionReference<MovieModel> getHistoryCollection() {
    return FirebaseFirestore.instance
        .collection("History")
        .withConverter<MovieModel>(
          fromFirestore: (snapshot, _) => MovieModel.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  static Future<void> createFavMovie(MovieModel movie) {
    var collection = getMoviesCollection();

    var docRef = collection.doc();

    movie.movieId = docRef.id;

    return docRef.set(movie);
  }

  static Future<void> addToHistory(MovieModel movie) async {
    final collection = getHistoryCollection();

    final doc = collection.doc();

    movie.movieId = doc.id;

    await doc.set(movie);
  }

  /// تجيب أفلام المستخدم
  static Stream<QuerySnapshot<MovieModel>> getFavMovies() {
    return getMoviesCollection()
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();
  }

  static Stream<QuerySnapshot<MovieModel>> getHistoryMovies() {
    return getHistoryCollection()
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();
  }
}
