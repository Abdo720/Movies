import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/user_hive_model.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';
import 'package:movies/features/main_Layout/Profile/data/local/UserLocalDs.dart';

@Injectable(as: UserLocalDs)
class UserLocalDsImpl implements UserLocalDs {
  static const String _boxName = 'user_box';

  Future<Box<UserHiveModel>> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<UserHiveModel>(_boxName);
    }
    return Hive.box<UserHiveModel>(_boxName);
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final box = await _openBox();
    await box.put(
      'current_user',
      UserHiveModel(
        name: user.name,
        id: user.id,
        email: user.email,
        phone: user.phone,
        image: user.image,
      ),
    );
  }

  @override
  Future<UserModel?> getUser() async {
    final box = await _openBox();
    final hive = box.get('current_user');
    if (hive == null) return null;
    return UserModel(
      name: hive.name,
      id: hive.id,
      email: hive.email,
      phone: hive.phone,
      image: hive.image,
    );
  }

  @override
  Future<void> clearUser() async {
    final box = await _openBox();
    await box.delete('current_user');
  }
}
