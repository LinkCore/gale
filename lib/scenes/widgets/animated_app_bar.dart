import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/common/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/app_colors.dart';
import '../../common/app_text.dart';
import '../../common/app_theme.dart';
import '../theme/theme_bloc/theme_bloc.dart';
import '../weather_bloc/weather_bloc.dart';
import '../weather_forecast_bloc/weather_forecast_bloc.dart';

class AnimatedAppBar extends StatefulWidget {
  final TextEditingController cityTextController;
  final String country;
  final String cityName;
  final ThemeData themeColor;

  AnimatedAppBar(
      {Key? key,
      required this.country,
      required this.cityName,
      required this.themeColor,
      required this.cityTextController})
      : super(key: key);

  @override
  _AnimatedAppBarState createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  double height = 0;
  double opacity = 0;

  Future<void> animatedHeight() async {
    if (height == 45) {
      setState(() {
        opacity = 0;
      });
      await Future.delayed(const Duration(milliseconds: 425));
      setState(() {
        height = 0;
      });
    } else {
      setState(() {
        height = 45;
      });
      await Future.delayed(const Duration(milliseconds: 425));
      setState(() {
        opacity = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color changeColorTheme = widget.themeColor != AppTheme.thunderstormTheme &&
            widget.themeColor != AppTheme.rainTheme &&
            widget.themeColor != AppTheme.brokenCloudsTheme
        ? AppColors.blackTextColor
        : AppColors.whiteTextColor;
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('${widget.country}, ',
                style: GoogleFonts.poppins(color: changeColorTheme)
                    .merge(AppTextStyles.appBarCountryTextStyle)),
            Text(widget.cityName,
                style: GoogleFonts.poppins(color: changeColorTheme)
                    .merge(AppTextStyles.appBarCityNameTextStyle)),
            Container(
                margin: const EdgeInsets.only(left: 0),
                child: InkWell(
                    child: Icon(Icons.keyboard_arrow_down_sharp,
                        color: changeColorTheme),
                    onTap: animatedHeight))
          ]),
          AnimatedContainer(
              curve: Curves.easeInQuad,
              margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
              height: height,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15)),
              duration: const Duration(milliseconds: 425),
              child: TextFormField(
                  onEditingComplete: () {
                    if (widget.cityTextController.text.isNotEmpty) {
                      context.read<ThemeBloc>().add(ThemeCityEvent(city: widget.cityTextController.text));
                      context.read<WeatherBloc>().add(WeatherCityEvent(city: widget.cityTextController.text));
                      context.read<WeatherForecastBloc>().add(WeatherForecastCityEvent(city: widget.cityTextController.text));
                      FocusManager.instance.primaryFocus?.unfocus();
                    } else {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }},
                  controller: widget.cityTextController,
                  decoration: InputDecoration(
                      hintText: AppText.searchForLocationTextField,
                      hintStyle: GoogleFonts.poppins(),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11.5),
                      border: InputBorder.none,
                      suffixIcon: AnimatedOpacity(
                          duration: const Duration(milliseconds: 425),
                          curve: Curves.easeInQuad,
                          opacity: opacity,
                          child: InkWell(
                              child: Icon(Icons.search, color: AppColors.greyTextColor),
                              onTap: () {
                                if (widget.cityTextController.text.isNotEmpty) {
                                  context.read<ThemeBloc>().add(ThemeCityEvent(city: widget.cityTextController.text));
                                  context.read<WeatherBloc>().add(WeatherCityEvent(city: widget.cityTextController.text));
                                  context.read<WeatherForecastBloc>().add(WeatherForecastCityEvent(city: widget.cityTextController.text));
                                  FocusManager.instance.primaryFocus?.unfocus();
                                } else {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }})))))]));
  }
}