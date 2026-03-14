import 'package:hive/hive.dart';

part '../../../../../movie_hive_model.g.dart';

@HiveType(typeId: 0)
class MovieHiveModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String? imdbCode;

  @HiveField(3)
  String? title;

  @HiveField(4)
  String? titleEnglish;

  @HiveField(5)
  String? titleLong;

  @HiveField(6)
  String? slug;

  @HiveField(7)
  int? year;

  @HiveField(8)
  num? rating;

  @HiveField(9)
  int? runtime;

  @HiveField(10)
  List<String>? genres;

  @HiveField(11)
  String? summary;

  @HiveField(12)
  String? descriptionFull;

  @HiveField(13)
  String? synopsis;

  @HiveField(14)
  String? ytTrailerCode;

  @HiveField(15)
  String? language;

  @HiveField(16)
  String? mpaRating;

  @HiveField(17)
  String? backgroundImage;

  @HiveField(18)
  String? backgroundImageOriginal;

  @HiveField(19)
  String? smallCoverImage;

  @HiveField(20)
  String? mediumCoverImage;

  @HiveField(21)
  String? largeCoverImage;

  @HiveField(22)
  String? state;

  @HiveField(23)
  String? dateUploaded;

  @HiveField(24)
  int? dateUploadedUnix;

  MovieHiveModel({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.dateUploaded,
    this.dateUploadedUnix,
  });
}
