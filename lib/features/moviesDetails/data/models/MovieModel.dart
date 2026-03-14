class MovieModel {
  int? id;
  String? movieId;
  String? url;
  String? title;
  num? rating;
  String? mediumCoverImage;
  String? userId;

  MovieModel({
    required this.id,
    required this.movieId,
    required this.url,
    required this.title,
    required this.rating,
    required this.mediumCoverImage,
    required this.userId,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['Movie_Id'];
    url = json['url'];
    title = json['title'];
    rating = json['rating'];
    mediumCoverImage = json['medium_cover_image'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Movie_Id': movieId,
      'url': url,
      'title': title,
      'rating': rating,
      'medium_cover_image': mediumCoverImage,
      'user_id': userId,
    };
  }
}
