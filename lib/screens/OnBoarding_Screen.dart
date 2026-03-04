import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _yellow = Color(0xFFF5C518);
const _dark = Color(0xFF141414);

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;

  final slides = const [
    {
      'image': 'assets/images/onBoarding2.png',
      'title': 'Discover Movies',
      'body': 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    },
    {
      'image': 'assets/images/onBoarding3.png',
      'title': 'Explore All Genres',
      'body': 'Discover movies from every genre, in all available qualities. Find something new and exciting every day.',
    },
    {
      'image': 'assets/images/onBoarding4.png',
      'title': 'Create Watchlists',
      'body': 'Save movies to your watchlist to keep track of what you want to watch next.',
    },
    {
      'image': 'assets/images/onBoarding5.png',
      'title': 'Rate, Review, and Learn',
      'body': 'Share your thoughts on movies you\'ve watched and help others discover great films.',
    },
    {
      'image': 'assets/images/onBoarding6.png',
      'title': 'Start Watching Now',
      'body': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final slide = slides[page];
    final isLast = page == slides.length - 1;

    return Scaffold(
      backgroundColor: _dark,
      body: Column(
        children: [
          // Image with gradient fade at bottom
          Expanded(
            child: ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white, Colors.transparent],
                stops: [0.0, 0.4, 1.0],
              ).createShader(rect),
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                slide['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          // Bottom panel
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: _dark,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 44.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  slide['title']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Body
                if (slide['body']!.isNotEmpty) ...[
                  SizedBox(height: 10.h),
                  Text(
                    slide['body']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFAAAAAA),
                      fontSize: 13.sp,
                      height: 1.55,
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
                        //
                      } else {
                        setState(() => page++);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _yellow,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      isLast ? 'Finish' : 'Next',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Back button
                if (page > 0) ...[
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: OutlinedButton(
                      onPressed: () => setState(() => page--),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _yellow,
                        side: const BorderSide(color: Color(0xFF444444)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: _yellow,
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
