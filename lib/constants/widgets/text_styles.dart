import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telegramm_clone/constants/app_color.dart';

class AppStyle {
  AppStyle._();

  static TextStyle get inter18xW500White => GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: 18.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      );

  static TextStyle get inter18xW500Black => GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );
  static TextStyle get inter14xW500Black => GoogleFonts.inter(
    textStyle:  TextStyle(
      fontSize: 14.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  );
  static TextStyle get inter16xW400White => GoogleFonts.inter(
    textStyle:  TextStyle(
      fontSize: 16.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get inter16xW400Black => GoogleFonts.inter(
    textStyle:  TextStyle(
      fontSize: 16.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get inter12xW400Black => GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 12.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get inter12xW600Blue => GoogleFonts.inter(
    textStyle:  TextStyle(
      fontSize: 12.sp,
      color: AppColors.blue,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  );

  static TextStyle get inter30xW600White => GoogleFonts.inter(
    textStyle:  TextStyle(
      fontSize: 30.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
  );

}
