import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';

class Generswidget extends StatelessWidget {
  final List<String> genres;

  const Generswidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 16.h,
      children: genres.map((genre) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.myGray,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(genre, style: StylesManager.white16W400Roboto),
        );
      }).toList(),
    );
  }
}
