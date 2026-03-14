import 'package:easy_localization/easy_localization.dart';
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
import 'package:movies/features/AuthenticationScreens/forgotPassScreen/firebaseFounctions/ForgotpassfirsbaseFuction.dart';

class Forgotpass extends StatelessWidget {
  final mailKey = GlobalKey<FormState>();
  TextEditingController emailControlar = TextEditingController();
  Forgotpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: AppBar(
        backgroundColor: AppColors.myBlack,
        title: Text(
          'forget_password'.tr(),
          style: StylesManager.yellow16W400Roboto,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.myYellow),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Form(
          key: mailKey,
          child: Column(
            children: [
              Image.asset(
                ImagesManager.forgotPass,
                width: 430.w,
                height: 430.h,
              ),
              SizedBox(height: 24.h),
              TextFieldWidget(
                controller: emailControlar,
                hintText: 'email'.tr(),
                preIcon: IconsManager.emailIcon,
                validator: (value) => ConstFunctions.validateEmail(value ?? ""),
              ),
              SizedBox(height: 24.h),
              BottomsYellow(
                text: Text(
                  'verify_email'.tr(),
                  style: StylesManager.black20W400Roboto,
                ),
                onClick: () {
                  if (mailKey.currentState!.validate()) {
                    Forgotpassfirsbasefuction.resetPassword(
                      emailControlar.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.myBlack,
                            content: Center(
                              child: Text(
                                'Check Your Email',
                                style: StylesManager.yellow16W400Roboto,
                              ),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      onError: (String message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
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
            ],
          ),
        ),
      ),
    );
  }
}
