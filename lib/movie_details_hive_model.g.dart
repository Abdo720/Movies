// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features/moviesDetails/data/models/movie_details_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsHiveModelAdapter extends TypeAdapter<MovieDetailsHiveModel> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsHiveModel(
      id: fields[0] as int?,
      url: fields[1] as String?,
      imdbCode: fields[2] as String?,
      title: fields[3] as String?,
      titleEnglish: fields[4] as String?,
      titleLong: fields[5] as String?,
      slug: fields[6] as String?,
      year: fields[7] as int?,
      rating: fields[8] as num?,
      runtime: fields[9] as int?,
      genres: (fields[10] as List?)?.cast<String>(),
      likeCount: fields[11] as int?,
      descriptionIntro: fields[12] as String?,
      descriptionFull: fields[13] as String?,
      ytTrailerCode: fields[14] as String?,
      language: fields[15] as String?,
      mpaRating: fields[16] as String?,
      backgroundImage: fields[17] as String?,
      backgroundImageOriginal: fields[18] as String?,
      smallCoverImage: fields[19] as String?,
      mediumCoverImage: fields[20] as String?,
      largeCoverImage: fields[21] as String?,
      mediumScreenshotImage1: fields[22] as String?,
      mediumScreenshotImage2: fields[23] as String?,
      mediumScreenshotImage3: fields[24] as String?,
      largeScreenshotImage1: fields[25] as String?,
      largeScreenshotImage2: fields[26] as String?,
      largeScreenshotImage3: fields[27] as String?,
      dateUploaded: fields[28] as String?,
      dateUploadedUnix: fields[29] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsHiveModel obj) {
    writer
      ..writeByte(30)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.imdbCode)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.titleEnglish)
      ..writeByte(5)
      ..write(obj.titleLong)
      ..writeByte(6)
      ..write(obj.slug)
      ..writeByte(7)
      ..write(obj.year)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.runtime)
      ..writeByte(10)
      ..write(obj.genres)
      ..writeByte(11)
      ..write(obj.likeCount)
      ..writeByte(12)
      ..write(obj.descriptionIntro)
      ..writeByte(13)
      ..write(obj.descriptionFull)
      ..writeByte(14)
      ..write(obj.ytTrailerCode)
      ..writeByte(15)
      ..write(obj.language)
      ..writeByte(16)
      ..write(obj.mpaRating)
      ..writeByte(17)
      ..write(obj.backgroundImage)
      ..writeByte(18)
      ..write(obj.backgroundImageOriginal)
      ..writeByte(19)
      ..write(obj.smallCoverImage)
      ..writeByte(20)
      ..write(obj.mediumCoverImage)
      ..writeByte(21)
      ..write(obj.largeCoverImage)
      ..writeByte(22)
      ..write(obj.mediumScreenshotImage1)
      ..writeByte(23)
      ..write(obj.mediumScreenshotImage2)
      ..writeByte(24)
      ..write(obj.mediumScreenshotImage3)
      ..writeByte(25)
      ..write(obj.largeScreenshotImage1)
      ..writeByte(26)
      ..write(obj.largeScreenshotImage2)
      ..writeByte(27)
      ..write(obj.largeScreenshotImage3)
      ..writeByte(28)
      ..write(obj.dateUploaded)
      ..writeByte(29)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
