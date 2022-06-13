import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/common/app_text_styles.dart';

import '../../common/app_colors.dart';
import '../../common/app_text.dart';
import '../theme/theme_bloc/theme_bloc.dart';
import '../weather_bloc/weather_bloc.dart';
import '../weather_forecast_bloc/weather_forecast_bloc.dart';

class AnimatedAppBar extends StatefulWidget {
  final TextEditingController cityTextController;
  final String country;
  final String cityName;
  final ThemeData themeColor;

  const AnimatedAppBar(
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
  bool isHintTextVisible = true;
  FocusNode searchNode = FocusNode();

  Future<void> animatedHeight() async {
    if (height == 45) {
      setState(() {
        opacity = 0;
      });
      await Future.delayed(const Duration(milliseconds: 425));
      setState(() {
        height = 0;
        FocusManager.instance.primaryFocus?.unfocus();
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
    String changeTextCountry =
        widget.country != '' ? '${widget.country}, ' : widget.country;

    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(children: [
          InkWell(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(changeTextCountry,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .merge(AppTextStyles.appBarCountryTextStyle)),
                Text(widget.cityName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .merge(AppTextStyles.appBarCityNameTextStyle)),
                Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Icon(Icons.keyboard_arrow_down_sharp,
                        color: Theme.of(context).textTheme.bodyText1!.color))
              ]),
              onTap: animatedHeight),
          AnimatedContainer(
              curve: Curves.easeInQuad,
              margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
              height: height,
              decoration: BoxDecoration(
                  color: AppColors.whiteTextColor,
                  borderRadius: BorderRadius.circular(15)),
              duration: const Duration(milliseconds: 425),
              child: Stack(children: [
                TextFormField(
                    focusNode: searchNode,
                    onChanged: (String value) {
                      if (value == '') {
                        setState(() {
                          isHintTextVisible = true;
                        });
                      } else {
                        setState(() {
                          isHintTextVisible = false;
                        });
                      }
                    },
                    onEditingComplete: () {
                      if (widget.cityTextController.text.isNotEmpty) {
                        context.read<ThemeBloc>().add(ThemeCityEvent(
                            city: widget.cityTextController.text));
                        context.read<WeatherBloc>().add(WeatherCityEvent(
                            city: widget.cityTextController.text));
                        context.read<WeatherForecastBloc>().add(
                            WeatherForecastCityEvent(
                                city: widget.cityTextController.text));
                        FocusManager.instance.primaryFocus?.unfocus();
                      } else {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    controller: widget.cityTextController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 11.5),
                        border: InputBorder.none,
                        suffixIcon: AnimatedOpacity(
                            duration: const Duration(milliseconds: 425),
                            curve: Curves.easeInQuad,
                            opacity: opacity,
                            child: InkWell(
                                child: Icon(Icons.search,
                                    color: AppColors.greyTextColor),
                                onTap: () {
                                  if (widget
                                      .cityTextController.text.isNotEmpty) {
                                    context.read<ThemeBloc>().add(
                                        ThemeCityEvent(
                                            city: widget
                                                .cityTextController.text));
                                    context.read<WeatherBloc>().add(
                                        WeatherCityEvent(
                                            city: widget
                                                .cityTextController.text));
                                    context.read<WeatherForecastBloc>().add(
                                        WeatherForecastCityEvent(
                                            city: widget
                                                .cityTextController.text));
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  } else {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  }
                                })))),
                Positioned(
                    child: GestureDetector(
                        onTap: () {
                          searchNode.requestFocus();
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 425),
                                curve: Curves.easeInQuad,
                                opacity: opacity,
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                40),
                                    child: Visibility(
                                        visible: isHintTextVisible,
                                        child: Text(
                                            AppText.searchForLocationTextField,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .merge(AppTextStyles
                                                    .hintTextStyle))))))))
              ]))
        ]));
  }
}