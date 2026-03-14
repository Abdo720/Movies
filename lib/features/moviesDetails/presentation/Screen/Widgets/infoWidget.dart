import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/icons_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';

class Infowidget extends StatelessWidget {
  num rating;
  int time;
  int likes;
  Infowidget({
    super.key,
    required this.rating,
    required this.time,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            height: 47.h,
            width: 122.w,
            decoration: BoxDecoration(
              color: AppColors.myGray,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(IconsManager.loveIcon),
                  color: AppColors.myYellow,
                  size: 28,
                ),
                SizedBox(width: 9.w),
                Text("$likes", style: StylesManager.white24BoldRoboto),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            height: 47.h,
            width: 122.w,
            decoration: BoxDecoration(
              color: AppColors.myGray,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(IconsManager.timeIcon),
                  color: AppColors.myYellow,
                  size: 28,
                ),
                SizedBox(width: 9.w),
                Text("$time", style: StylesManager.white24BoldRoboto),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            height: 47.h,
            width: 122.w,
            decoration: BoxDecoration(
              color: AppColors.myGray,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(IconsManager.ratingIcon),
                  color: AppColors.myYellow,
                  size: 28,
                ),
                SizedBox(width: 9.w),
                Text("$rating", style: StylesManager.white24BoldRoboto),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
