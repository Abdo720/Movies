// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features/main_Layout/Home/data/models/movie_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHiveModelAdapter extends TypeAdapter<MovieHiveModel> {
  @override
  final int typeId = 0;

  @override
  MovieHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHiveModel(
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
      summary: fields[11] as String?,
      descriptionFull: fields[12] as String?,
      synopsis: fields[13] as String?,
      ytTrailerCode: fields[14] as String?,
      language: fields[15] as String?,
      mpaRating: fields[16] as String?,
      backgroundImage: fields[17] as String?,
      backgroundImageOriginal: fields[18] as String?,
      smallCoverImage: fields[19] as String?,
      mediumCoverImage: fields[20] as String?,
      largeCoverImage: fields[21] as String?,
      state: fields[22] as String?,
      dateUploaded: fields[23] as String?,
      dateUploadedUnix: fields[24] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieHiveModel obj) {
    writer
      ..writeByte(25)
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
      ..write(obj.summary)
      ..writeByte(12)
      ..write(obj.descriptionFull)
      ..writeByte(13)
      ..write(obj.synopsis)
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
      ..write(obj.state)
      ..writeByte(23)
      ..write(obj.dateUploaded)
      ..writeByte(24)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
