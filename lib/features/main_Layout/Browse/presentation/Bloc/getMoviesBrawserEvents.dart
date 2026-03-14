abstract class BlocBrawserEvents {}

class FetchMoviesBrawserPageEvent implements BlocBrawserEvents {
  final String genre;
  final int page;

  FetchMoviesBrawserPageEvent(this.genre, {this.page = 1});
}

class ResetGenreEvent implements BlocBrawserEvents {
  final String genre;

  ResetGenreEvent(this.genre);
}
