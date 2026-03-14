abstract class BlocEvents {}

class FetchMoviesPageEvent implements BlocEvents {
  final String genre;
  final int page;

  FetchMoviesPageEvent(this.genre, {this.page = 1});
}
