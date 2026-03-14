import 'package:hive/hive.dart';

part '../../../../user_hive_model.g.dart';

@HiveType(typeId: 2)
class UserHiveModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String id;

  @HiveField(2)
  String email;

  @HiveField(3)
  String phone;

  @HiveField(4)
  String image;

  UserHiveModel({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.image,
  });
}
