import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';

class BottomsYellow extends StatelessWidget {
  final Widget text;
  final VoidCallback onClick;
  BottomsYellow({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.myYellow,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: text,
      ),
    );
  }
}

class BottomsBlack extends StatelessWidget {
  final Widget text;
  final VoidCallback onClick;
  BottomsBlack({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.myBlack,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.myYellow),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: text,
      ),
    );
  }
}

class BottomsRed extends StatelessWidget {
  final Widget text;
  final VoidCallback onClick;
  BottomsRed({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.myRed,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: text,
      ),
    );
  }
}
