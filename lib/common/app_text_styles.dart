import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles{
  static TextStyle appBarCountryTextStyle = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle appBarCityNameTextStyle = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle weatherCartMainDescriptionTextStyle = GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.whiteTextColor);
  static TextStyle weatherCartMainTempTextStyle = GoogleFonts.poppins(fontSize: 80, fontWeight: FontWeight.w600, color: AppColors.whiteTextColor);
  static TextStyle weatherCartMainFeelsLikeTextStyle = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.whiteTextColor);
  static TextStyle descriptionCartTitleTextStyle = GoogleFonts.poppins(fontWeight: FontWeight.w800, color: AppColors.lightGreyTextColor);
  static TextStyle descriptionCartSubtitleTextStyle = GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppColors.greyTextColor);
  static TextStyle forecastCartTitleTextStyle = GoogleFonts.poppins(fontWeight: FontWeight.w700, color: AppColors.whiteTextColor);
  static TextStyle forecastCartSubtitleTextStyle = GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.whiteTextColor);
  static TextStyle forecastCartEndTitleTextStyle = GoogleFonts.poppins(fontWeight: FontWeight.w500, color: AppColors.whiteTextColor);
  static TextStyle errorTextStyle = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
}