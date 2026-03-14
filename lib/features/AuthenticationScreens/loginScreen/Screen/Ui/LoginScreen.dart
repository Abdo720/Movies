import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/CachHelper/SharedPreferences.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/constans/constFounctions.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/AuthenticationScreens/loginScreen/Screen/Widgets/languageToggle.dart';
import 'package:movies/features/AuthenticationScreens/loginScreen/fireBaseFounctions/LoginfirebaseFounctions.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/firebaseFounctions/RegisterfirebaseFunctions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/Widgets/TextFildWidgets.dart';

class Loginscreen extends StatelessWidget {
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.myBlack,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Form(
          key: loginKey,
          child: Column(
            children: [
              SizedBox(height: 67.h),
              Image.asset(
                ImagesManager.splashLogo1,
                width: 121.w,
                height: 118.h,
              ),
              SizedBox(height: 69.h),
              TextFieldWidget(
                controller: emailController,
                hintText: "email".tr(),
                preIcon: IconsManager.emailIcon,
                validator: (value) => ConstFunctions.validateEmail(value ?? ""),
              ),
              SizedBox(height: 22.4.h),
              TextFieldWidget(
                controller: passController,
                hintText: "password".tr(),
                preIcon: IconsManager.passIcon,
                validator: (value) =>
                    ConstFunctions.validatePassword(value ?? ""),
                isPassword: true,
              ),
              SizedBox(height: 17.8.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "forget_password".tr(),
                      style: StylesManager.yellow14W400Inter,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.26.h),
              BottomsYellow(
                text: Text(
                  "login".tr(),
                  style: StylesManager.black16BoldRoboto,
                ),
                onClick: () {
                  if (loginKey.currentState!.validate()) {
                    Loginfirebasefounctions.signIn(
                      emailController.text,
                      passController.text,
                      onSucces: (user) async {
                        await Sharedpreferences.Savebool2(true);
                        Navigator.pushNamed(context, AppRoutes.home);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.myBlack,
                            content: Center(
                              child: Text(
                                "Welcome ${user.email ?? ""}",
                                style: StylesManager.yellow16BoldRoboto,
                              ),
                            ),
                          ),
                        );
                      },
                      onError: (String message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 5),
                            backgroundColor: AppColors.myBlack,
                            content: Text(
                              message,
                              style: StylesManager.yellow16W400Roboto,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 22.74.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "no_account".tr(),
                    style: StylesManager.white14W400Roboto,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registerScreen);
                    },
                    child: Text(
                      "create_one".tr(),
                      style: StylesManager.yellow14BoldRoboto,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 27.7.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: AppColors.myYellow),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or".tr(),
                      style: StylesManager.yellow14W400Inter,
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: AppColors.myYellow),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              BottomsYellow(
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(IconsManager.googleIcon),
                      color: AppColors.myBlack,
                      size: 30.r,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      "login_google".tr(),
                      style: StylesManager.black16BoldRoboto,
                    ),
                  ],
                ),
                onClick: () async {
                  final user =
                      await Loginfirebasefounctions.signInWithGoogleSafe();
                  if (user != null) {
                    await Sharedpreferences.Savebool3(true);
                    Navigator.pushNamed(context, AppRoutes.home);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.myBlack,
                        content: Text(
                          "Welcome ${user.email ?? ""}",
                          style: StylesManager.yellow16BoldRoboto,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 33.6.h),
              LanguageToggle(),
            ],
          ),
        ),
      ),
    );
  }
}
