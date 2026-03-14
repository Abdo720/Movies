import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Widgets/TextFildWidgets.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/constans/constFounctions.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/screen/Widgets/photosSlider.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/firebaseFounctions/RegisterfirebaseFunctions.dart';
import 'package:movies/features/AuthenticationScreens/loginScreen/Screen/Widgets/languageToggle.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conPass = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  String selectedAvatar = ImagesManager.avtar1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.myBlack,
      appBar: AppBar(
        backgroundColor: AppColors.myBlack,
        title: Text("register".tr(), style: StylesManager.yellow16W400Roboto),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.myYellow),
      ),
      body: Form(
        key: registerKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                PhotosSlider(
                  onSelect: (image) {
                    selectedAvatar = image;
                  },
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: name,
                  hintText: "name".tr(),
                  preIcon: IconsManager.nameIcon,
                  validator: (value) =>
                      ConstFunctions.validateName(value ?? ""),
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: email,
                  hintText: "email".tr(),
                  preIcon: IconsManager.emailIcon,
                  validator: (value) =>
                      ConstFunctions.validateEmail(value ?? ""),
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: pass,
                  hintText: "password".tr(),
                  preIcon: IconsManager.passIcon,
                  isPassword: true,
                  validator: (value) =>
                      ConstFunctions.validatePassword(value ?? ""),
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: conPass,
                  hintText: "confirm_password".tr(),
                  preIcon: IconsManager.passIcon,
                  isPassword: true,
                  validator: (value) => ConstFunctions.validateConfirmPassword(
                    value ?? "",
                    pass.text,
                  ),
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: phone,
                  hintText: "phone".tr(),
                  preIcon: IconsManager.phoneIcon,
                  validator: (value) =>
                      ConstFunctions.validatePhone(value ?? ""),
                ),
                SizedBox(height: 24.h),
                BottomsYellow(
                  text: Text(
                    "create_account".tr(),
                    style: StylesManager.black20BoldRoboto,
                  ),
                  onClick: () async {
                    if (registerKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.myYellow,
                          ),
                        ),
                      );
                      await RegisterFirebaseFunctions.createUser(
                        name.text,
                        email.text,
                        pass.text,
                        phone.text,
                        selectedAvatar,
                        onLoading: (_) {},
                        onSuccess: () async {
                          final user = FirebaseAuth.instance.currentUser;
                          if (user != null) {}
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        onError: (String message) {
                          Navigator.of(context).pop();
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
                SizedBox(height: 17.67.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have_account".tr(),
                      style: StylesManager.white14W400Roboto,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                      child: Text(
                        "login".tr(),
                        style: StylesManager.yellow14BoldRoboto,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.67.h),
                LanguageToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
