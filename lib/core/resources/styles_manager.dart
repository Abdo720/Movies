import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/resources/colors_manager.dart';

abstract class StylesManager {
  static TextStyle roboto14Bold = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white16BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white18BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white20BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white24BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white16W400Roboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white20W400Roboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white14W400Roboto = GoogleFonts.roboto(
    color: AppColors.myWhite,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  // Inter

  static TextStyle white16W500Inter = GoogleFonts.inter(
    color: AppColors.myWhite,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle white16W400Inter = GoogleFonts.inter(
    color: AppColors.myWhite,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white24BoldInter = GoogleFonts.inter(
    color: AppColors.myWhite,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white20BoldInter = GoogleFonts.inter(
    color: AppColors.myWhite,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle white20W400Inter = GoogleFonts.inter(
    color: AppColors.myWhite,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white36W500Inter = GoogleFonts.inter(
    color: AppColors.myWhite,
    fontSize: 36.sp,
    fontWeight: FontWeight.w500,
  );

  // Gray

  static TextStyle gray16BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle gray18BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myGray,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle gray20BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myGray,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle gray24BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myGray,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle gray16W400Roboto = GoogleFonts.roboto(
    color: AppColors.myGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle gray20W400Roboto = GoogleFonts.roboto(
    color: AppColors.myGray,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle gray16W500Inter = GoogleFonts.inter(
    color: AppColors.myGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle gray16W400Inter = GoogleFonts.inter(
    color: AppColors.myGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle gray24BoldInter = GoogleFonts.inter(
    color: AppColors.myGray,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle gray20BoldInter = GoogleFonts.inter(
    color: AppColors.myGray,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  // Black

  static TextStyle black16BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black18BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myBlack,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black20BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myBlack,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black24BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black16W400Roboto = GoogleFonts.roboto(
    color: AppColors.myBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black20W400Roboto = GoogleFonts.roboto(
    color: AppColors.myBlack,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black16W500Inter = GoogleFonts.inter(
    color: AppColors.myBlack,
    fontSize: 36.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle black16W400Inter = GoogleFonts.inter(
    color: AppColors.myBlack,
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black24BoldInter = GoogleFonts.inter(
    color: AppColors.myBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black20BoldInter = GoogleFonts.inter(
    color: AppColors.myBlack,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  //Yellow Roboto

  static TextStyle yellow14BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle yellow16BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle yellow18BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle yellow20BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle yellow24BoldRoboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle yellow16W400Roboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle yellow20W400Roboto = GoogleFonts.roboto(
    color: AppColors.myYellow,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );

  // Yellow Inter

  static TextStyle yellow16W500Inter = GoogleFonts.inter(
    color: AppColors.myYellow,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle yellow16W400Inter = GoogleFonts.inter(
    color: AppColors.myYellow,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle yellow14W400Inter = GoogleFonts.inter(
    color: AppColors.myYellow,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle yellow24BoldInter = GoogleFonts.inter(
    color: AppColors.myYellow,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle yellow20BoldInter = GoogleFonts.inter(
    color: AppColors.myYellow,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
}
