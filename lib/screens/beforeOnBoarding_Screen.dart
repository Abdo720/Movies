import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/resources/colors_manager.dart';
import '../core/resources/images_manager.dart';
import '../routes/app_routes.dart';

class BeforeonboardingScreen extends StatelessWidget {
  const BeforeonboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.myBlack,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1E1E1E),
                 Color(0xFF121312),
                 Color(0xFF121312),
                  Color(0xFF121312),
                ],
                stops: [0.0, 0.5, 0.91, 1.0],
              ),
            ),
            child:   Image.asset(ImagesManager.onBoarding,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 16.0.w,right: 16.0.w,bottom: 33.h),
            child: SizedBox(
              height: 252.h,
              child: Column(
                children: [
              Text(
              "Find Your Next Favorite Movie Here",

                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.myWhite,
                  fontSize: 33.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
                  SizedBox(height: 16.h),
                  Text(
                "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.myWhite.withOpacity(0.6),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.myYellow,
                        foregroundColor:AppColors.myBlack,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Text(
                       'Explore Now',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
