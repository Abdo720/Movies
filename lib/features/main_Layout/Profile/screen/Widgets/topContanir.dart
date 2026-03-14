import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/CachHelper/SharedPreferences.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:movies/core/routes/approutes.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/firebaseFounctions/RegisterfirebaseFunctions.dart';
import 'package:movies/features/AuthenticationScreens/registerScreeen/model/usermodel.dart';

class Topcontanir extends StatelessWidget {
  final int favCount;
  final int historyCount;
  final UserModel? model;

  const Topcontanir({
    super.key,
    required this.favCount,
    required this.historyCount,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return SizedBox(
        height: 389.h,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.myYellow),
        ),
      );
    }

    final user = model!;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 290.h,
      child: Container(
        color: AppColors.myGray,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 52.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(user.image, width: 118.w, height: 118.w),
                      SizedBox(height: 15.h),
                      Text(
                        user.name,
                        style: StylesManager.white20BoldRoboto,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("$favCount", style: StylesManager.white36W500Inter),
                      SizedBox(height: 15.h),
                      Text(
                        'wishlist'.tr(),
                        style: StylesManager.white20BoldRoboto,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "$historyCount",
                        style: StylesManager.white36W500Inter,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'history'.tr(),
                        style: StylesManager.white20BoldRoboto,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: BottomsYellow(
                    text: Text(
                      "edit_profile".tr(),
                      style: StylesManager.black20W400Roboto,
                    ),
                    onClick: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.editProfile,
                        arguments: user,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  width: 135,
                  child: BottomsRed(
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "exit".tr(),
                          style: StylesManager.white20W400Roboto,
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          CupertinoIcons.square_arrow_right,
                          size: 37.r,
                          color: AppColors.myWhite,
                        ),
                      ],
                    ),
                    onClick: () async {
                      await RegisterFirebaseFunctions.signOut();
                      await Sharedpreferences.Savebool2(false);
                      await Sharedpreferences.Savebool3(false);
                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
