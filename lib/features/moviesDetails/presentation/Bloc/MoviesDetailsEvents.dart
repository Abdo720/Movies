abstract class BlocDetailsEvents {}

class GetMovieDetailsEvent implements BlocDetailsEvents {
  final int id;
  GetMovieDetailsEvent(this.id);
}

class ToggleSaveMovieEvent implements BlocDetailsEvents {}

class AddMovieToHistoryEvent implements BlocDetailsEvents {}
