import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/AuthenticationScreens/forgotPassScreen/screen/Ui/forgotpass.dart';
import 'package:movies/features/AuthenticationScreens/loginScreen/Screen/Ui/LoginScreen.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/screen/Ui/registerScreen.dart';
import 'package:movies/features/main_Layout/Profile/Editprofile/EditProfile.dart';
import 'package:movies/features/main_Layout/mainLayout.dart';
import 'package:movies/features/moviesDetails/presentation/Screen/Ui/moviesDetails.dart';
import 'package:movies/features/onBoarding/onBoarding2.dart';
import '../../features/onBoarding/onBoarding1.dart';
import '../../features/onBoarding/onBoarding3.dart';
import '../../features/onBoarding/onBoarding4.dart';
import '../../features/onBoarding/onBoarding5.dart';
import '../../features/onBoarding/onBoarding6.dart';
import '../../features/splachScreen/splashScreen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onBoarding1 = "/onBoarding1";
  static const String onBoarding2 = "/onBoarding2";
  static const String onBoarding3 = "/onBoarding3";
  static const String onBoarding4 = "/onBoarding4";
  static const String onBoarding5 = "/onBoarding5";
  static const String onBoarding6 = "/onBoarding6";
  static const String loginScreen = "/loginScreen";
  static const String forgotPassword = "/forgotPassword";
  static const String registerScreen = "/registerScreen";
  static const String home = "/HomeScreen";
  static const String detailsScreen = "/DetailsScreen";
  static const String editProfile = "/EditProfile";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      case onBoarding1:
        return MaterialPageRoute(builder: (_) => const Onboarding1());
      case onBoarding2:
        return MaterialPageRoute(builder: (_) => const Onboarding2());
      case onBoarding3:
        return MaterialPageRoute(builder: (_) => const Onboarding3());
      case onBoarding4:
        return MaterialPageRoute(builder: (_) => const Onboarding4());
      case onBoarding5:
        return MaterialPageRoute(builder: (_) => const Onboarding5());
      case onBoarding6:
        return MaterialPageRoute(builder: (_) => const Onboarding6());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => Loginscreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => Mainlayout());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => Forgotpass());
      case detailsScreen:
        {
          int id = settings.arguments as int;
          return MaterialPageRoute(builder: (_) => MoviesDetails(id: id));
        }
      case editProfile:
        {
          UserModel model = settings.arguments as UserModel;
          return MaterialPageRoute(builder: (_) => Editprofile(model: model));
        }
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
