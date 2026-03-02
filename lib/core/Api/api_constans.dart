class ApiConstans {
  static const String baseUrl = "https://movies-api.accel.li/api/v2/";
  static const String listMoviesEndPoints = "list_movies.json";
  static const String movieDetails =
      "movie_details.json?movie_id=15&with_images=true&with_cast=true";
  // ال movie_id لازم يتبعت علشان دا الي بيتجاب علي اساسوا ال ديتلز وخلي دايما الاتينين التانين دول ب تروا هتحتاجهم
  static const String moviesSemiller = "movie_suggestions.json?movie_id=10";
  // ال movie_id لازم دا بيجيب الافلام المشابهة لل فلم الي انت موجود فيه
}
