import 'package:flutter/material.dart';
import 'package:gale/common/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData clearSkyTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.clearSkyColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData fewCloudsTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.fewCloudsColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData scatteredCloudsTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scatteredCloudsColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData overcastCloudsTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.overcastCloudsColor,
    textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData brokenCloudsTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.brokenCloudsColor,
      textTheme: TextTheme(
          bodyText1: AppTextStyles.appBarCityNameTextStyle
              .merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData showerRainTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.showerRainColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData rainTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.rainColor,
      textTheme: TextTheme(
          bodyText1: AppTextStyles.appBarCityNameTextStyle
              .merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData lightRainTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.lightRainColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData moderateRainTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.moderateRainColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData thunderstormTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.thunderstormColor,
      textTheme: TextTheme(
          bodyText1: AppTextStyles.appBarCityNameTextStyle
              .merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData snowTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.snowColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData mistTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.mistColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData hazeTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.hazeColor,
      textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
}