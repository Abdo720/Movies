import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';

class Screenshotswidget extends StatelessWidget {
  String screenShot1;
  String screenShot2;
  String screenShot3;
  Screenshotswidget({
    super.key,
    required this.screenShot1,
    required this.screenShot2,
    required this.screenShot3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 9.h, bottom: 14.h),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: screenShot1,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.myYellow),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error, color: AppColors.myYellow)),
                fit: BoxFit.cover,
                height: 167,
                width: double.infinity,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsetsGeometry.only(top: 14.h, bottom: 14.h),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: screenShot2,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.myYellow),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error, color: AppColors.myYellow)),
                fit: BoxFit.cover,
                height: 167,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.only(top: 14.h, bottom: 8.h),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: screenShot3,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.myYellow),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error, color: AppColors.myYellow)),
                fit: BoxFit.cover,
                height: 167,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
