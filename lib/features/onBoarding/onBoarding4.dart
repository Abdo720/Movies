import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/routes/approutes.dart';

import '../../core/resources/styles_manager.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImagesManager.onBoarding4, fit: BoxFit.fill),
          ),
          Positioned.fill(
            child: Container(color: AppColors.myPurpele.withOpacity(0.5)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.myBlack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create Watchlists',
                    style: StylesManager.white24BoldInter,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
                    style: StylesManager.white16W400Inter,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  BottomsYellow(
                    text: Text('Next', style: StylesManager.black16BoldRoboto),
                    onClick: () {
                      Navigator.pushNamed(context, AppRoutes.onBoarding5);
                    },
                  ),
                  SizedBox(height: 16.h),
                  BottomsBlack(
                    text: Text('Back', style: StylesManager.yellow16BoldRoboto),
                    onClick: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
