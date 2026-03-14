import 'package:hive/hive.dart';

part '../../../../movie_details_hive_model.g.dart';

@HiveType(typeId: 1)
class MovieDetailsHiveModel extends HiveObject {
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
  int? likeCount;

  @HiveField(12)
  String? descriptionIntro;

  @HiveField(13)
  String? descriptionFull;

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
  String? mediumScreenshotImage1;

  @HiveField(23)
  String? mediumScreenshotImage2;

  @HiveField(24)
  String? mediumScreenshotImage3;

  @HiveField(25)
  String? largeScreenshotImage1;

  @HiveField(26)
  String? largeScreenshotImage2;

  @HiveField(27)
  String? largeScreenshotImage3;

  @HiveField(28)
  String? dateUploaded;

  @HiveField(29)
  int? dateUploadedUnix;

  MovieDetailsHiveModel({
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
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.largeScreenshotImage1,
    this.largeScreenshotImage2,
    this.largeScreenshotImage3,
    this.dateUploaded,
    this.dateUploadedUnix,
  });
}
