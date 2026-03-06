import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/resources/colors_manager.dart';
import '../core/resources/images_manager.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;


  final slides = const [
    {
      'image': ImagesManager.onBoarding2,
      'title': 'Discover Movies',
      'body': 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    },
    {
      'image': ImagesManager.onBoarding3,
      'title': 'Explore All Genres',
      'body': 'Discover movies from every genre, in all available qualities. Find something new and exciting every day.',
    },
    {
      'image': ImagesManager.onBoarding4,
      'title': 'Create Watchlists',
      'body': 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    },
    {
      'image': ImagesManager.onBoarding5,
      'title': 'Rate, Review, and Learn',
      'body': "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      'image': ImagesManager.onBoarding6,
      'title': 'Start Watching Now',
      'body': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final slide = slides[page];
    final isLast = page == slides.length - 1;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            slide['image']!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Container(
            width: double.infinity,
            decoration:  BoxDecoration(
              color:AppColors.myBlack,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
            ),
            padding: EdgeInsets.only(left:16.w,top: 27.h,right:  16.w,bottom:16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  slide['title']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: AppColors.myWhite,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (slide['body']!.isNotEmpty) ...[
                  SizedBox(height: 9.h),
                  Text(
                    slide['body']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color:  AppColors.myWhite,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isLast) {
                        //هنا هيودي لصفحة login
                      } else {
                        setState(() => page++);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.myYellow,
                      foregroundColor:AppColors.myBlack,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      isLast ? 'Finish' : 'Next',
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                if (page > 0) ...[
                  SizedBox(height: 14.h),
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: OutlinedButton(
                      onPressed: () => setState(() => page--),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.myYellow,
                        side:  BorderSide(color: AppColors.myGray),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        'Back',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.myYellow,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
