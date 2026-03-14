import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/Widgets/bottoms.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/images_manager.dart';
import 'package:movies/core/routes/approutes.dart';

import '../../core/resources/styles_manager.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImagesManager.onBoarding1, fit: BoxFit.fill),
          ),
          Positioned.fill(
            child: Container(color: AppColors.myBlack.withOpacity(0.7)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Find Your Next Favorite Movie Here',
                    style: StylesManager.white36W500Inter,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Get access to a huge library of movies to suit all tastes. You will surely like it.',
                    style: StylesManager.white16W400Inter,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  BottomsYellow(
                    text: Text(
                      'Explore Now',
                      style: StylesManager.black18BoldRoboto,
                    ),
                    onClick: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.onBoarding2,
                        (routes) => false,
                      );
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
