import 'package:flutter/material.dart';
import 'package:gale/common/app_colors.dart';
import 'package:gale/scenes/weather_has_data/widgets/widgets_section/weather_cart_description_section.dart';

import '../../../common/app_text.dart';
import '../../weather_bloc/weather_bloc.dart';

class WeatherCartDescription extends StatefulWidget {
  final WeatherHasDataState state;

  const WeatherCartDescription({Key? key, required this.state})
      : super(key: key);

  @override
  _WeatherCartDescriptionState createState() => _WeatherCartDescriptionState();
}

class _WeatherCartDescriptionState extends State<WeatherCartDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 7,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.whiteTextColor),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          WeatherCartDescriptionSection(
              textSubtitle: AppText.mS,
              textTitle: AppText.wind,
              state: widget.state),
          WeatherCartDescriptionSection(
              textSubtitle: AppText.percent,
              textTitle: AppText.humidity,
              state: widget.state),
          WeatherCartDescriptionSection(
              textSubtitle: AppText.km,
              textTitle: AppText.visibility,
              state: widget.state)
        ]));
  }
}