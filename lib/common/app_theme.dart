import 'package:flutter/material.dart';
import 'package:gale/common/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {

//clear
  static ThemeData clearSkyTheme = ThemeData(scaffoldBackgroundColor: AppColors.clearSkyColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//clouds
  static ThemeData fewCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.fewCloudsColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData scatteredCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.scatteredCloudsColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData brokenCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.brokenCloudsColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData overcastCloudsTheme = ThemeData(scaffoldBackgroundColor: AppColors.overcastCloudsColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//thunderstorm
  static ThemeData thunderstormTheme = ThemeData(scaffoldBackgroundColor: AppColors.thunderstormColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData lightThunderstormTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightThunderstormColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData heavyThunderstormTheme = ThemeData(scaffoldBackgroundColor: AppColors.heavyThunderstormColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//drizzle
  static ThemeData drizzleTheme = ThemeData(scaffoldBackgroundColor: AppColors.drizzleColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData lightDrizzleTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightDrizzleColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData heavyDrizzleTheme = ThemeData(scaffoldBackgroundColor: AppColors.heaveDrizzleColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//rain
  static ThemeData rainTheme = ThemeData(scaffoldBackgroundColor: AppColors.rainColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData lightRainTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightRainColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData heavyRainTheme = ThemeData(scaffoldBackgroundColor: AppColors.heavyRainColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//snow
  static ThemeData lightSnowTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightSnowColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData heavySnowTheme = ThemeData(scaffoldBackgroundColor: AppColors.heavySnowColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData snowTheme = ThemeData(scaffoldBackgroundColor: AppColors.snowColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//mist
  static ThemeData hazeTheme = ThemeData(scaffoldBackgroundColor: AppColors.hazeColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData mistTheme = ThemeData(scaffoldBackgroundColor: AppColors.mistColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData fogTheme = ThemeData(scaffoldBackgroundColor: AppColors.fogColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//sand
  static ThemeData dustTheme = ThemeData(scaffoldBackgroundColor: AppColors.dustColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData sandTheme = ThemeData(scaffoldBackgroundColor: AppColors.sandColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle));
  static ThemeData sandAndDustWhirlsTheme = ThemeData(scaffoldBackgroundColor: AppColors.sandAndDustWhirlsColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));

//smoke
  static ThemeData smokeTheme = ThemeData(scaffoldBackgroundColor: AppColors.smokeColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData squallsTheme = ThemeData(scaffoldBackgroundColor: AppColors.squallsColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData tornadoTheme = ThemeData(scaffoldBackgroundColor: AppColors.tornadoColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
  static ThemeData volcanicAshTheme = ThemeData(scaffoldBackgroundColor: AppColors.volcanicAshColor, textTheme: TextTheme(bodyText1: AppTextStyles.appBarCityNameTextStyle.merge(GoogleFonts.poppins(color: AppColors.whiteTextColor))));
}