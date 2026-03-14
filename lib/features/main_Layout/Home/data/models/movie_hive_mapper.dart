import 'package:movies/features/main_Layout/Home/data/models/MoviesResponse.dart';
import 'package:movies/features/main_Layout/Home/data/models/movie_hive_model.dart';

extension MovieToHive on Movies {
  MovieHiveModel toHive() => MovieHiveModel(
    id: id,
    url: url,
    imdbCode: imdbCode,
    title: title,
    titleEnglish: titleEnglish,
    titleLong: titleLong,
    slug: slug,
    year: year,
    rating: rating,
    runtime: runtime,
    genres: genres,
    summary: summary,
    descriptionFull: descriptionFull,
    synopsis: synopsis,
    ytTrailerCode: ytTrailerCode,
    language: language,
    mpaRating: mpaRating,
    backgroundImage: backgroundImage,
    backgroundImageOriginal: backgroundImageOriginal,
    smallCoverImage: smallCoverImage,
    mediumCoverImage: mediumCoverImage,
    largeCoverImage: largeCoverImage,
    state: state,
    dateUploaded: dateUploaded,
    dateUploadedUnix: dateUploadedUnix,
  );
}

extension HiveToMovie on MovieHiveModel {
  Movies toMovie() => Movies(
    id: id,
    url: url,
    imdbCode: imdbCode,
    title: title,
    titleEnglish: titleEnglish,
    titleLong: titleLong,
    slug: slug,
    year: year,
    rating: rating,
    runtime: runtime,
    genres: genres,
    summary: summary,
    descriptionFull: descriptionFull,
    synopsis: synopsis,
    ytTrailerCode: ytTrailerCode,
    language: language,
    mpaRating: mpaRating,
    backgroundImage: backgroundImage,
    backgroundImageOriginal: backgroundImageOriginal,
    smallCoverImage: smallCoverImage,
    mediumCoverImage: mediumCoverImage,
    largeCoverImage: largeCoverImage,
    state: state,
    dateUploaded: dateUploaded,
    dateUploadedUnix: dateUploadedUnix,
  );
}
