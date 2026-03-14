import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';

abstract class UserLocalDs {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> clearUser();
}
