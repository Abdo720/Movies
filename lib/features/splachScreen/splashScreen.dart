import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/CachHelper/SharedPreferences.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/routes/approutes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var intro = Sharedpreferences.Getbool1("Intro");
  var signIn = Sharedpreferences.Getbool2("sign_in");
  var google = Sharedpreferences.Getbool3("google");

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (intro == true) {
        if (signIn == true || google == true) {
          Navigator.pushNamed(context, AppRoutes.home);
        } else {
          Navigator.pushNamed(context, AppRoutes.loginScreen);
        }
      } else {
        Navigator.pushNamed(context, AppRoutes.onBoarding1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 280.h),
          Image.asset(ImagesManager.splashLogo1, width: 253.w, height: 253.h),
          SizedBox(height: 339.h),
          Image.asset(ImagesManager.splashLogo2, width: 244.w, height: 38.h),
          SizedBox(height: 22.h),
        ],
      ),
    );
  }
}
