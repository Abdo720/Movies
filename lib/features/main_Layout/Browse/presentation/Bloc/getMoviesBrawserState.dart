import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';

class GenreMoviesBraweserState {
  final List<Movies> movies;
  final int currentPage;
  final bool isLastPage;
  final bool isLoading;
  final String? error;

  GenreMoviesBraweserState({
    required this.movies,
    this.currentPage = 0,
    this.isLastPage = false,
    this.isLoading = false,
    this.error,
  });

  GenreMoviesBraweserState copyWith({
    List<Movies>? movies,
    int? currentPage,
    bool? isLastPage,
    bool? isLoading,
    String? error,
  }) {
    return GenreMoviesBraweserState(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class BlocBrawserState {
  final Map<String, GenreMoviesBraweserState> genres;

  BlocBrawserState({required this.genres});

  BlocBrawserState copyWith({Map<String, GenreMoviesBraweserState>? genres}) {
    return BlocBrawserState(genres: genres ?? this.genres);
  }
}
