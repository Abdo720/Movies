abstract class BlocSearchEvents {}

class Searchevents implements BlocSearchEvents {
  String word;
  int page;

  Searchevents({required this.word, this.page = 1});
}
