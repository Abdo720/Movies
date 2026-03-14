import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

class GenreMoviesState {
  final List<Movies> movies;
  final List<Movies>? newItems;
  final int currentPage;
  final bool isLastPage;
  final bool isLoading;
  final String? error;

  GenreMoviesState({
    required this.movies,
    this.newItems,
    this.currentPage = 1,
    this.isLastPage = false,
    this.isLoading = false,
    this.error,
  });

  GenreMoviesState copyWith({
    List<Movies>? movies,
    List<Movies>? newItems,
    int? currentPage,
    bool? isLastPage,
    bool? isLoading,
    String? error,
  }) {
    return GenreMoviesState(
      movies: movies ?? this.movies,
      newItems: newItems ?? this.newItems,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class BlocState {
  final Map<String, GenreMoviesState> genres;

  BlocState({required this.genres});

  BlocState copyWith({Map<String, GenreMoviesState>? genres}) {
    return BlocState(genres: genres ?? this.genres);
  }
}
