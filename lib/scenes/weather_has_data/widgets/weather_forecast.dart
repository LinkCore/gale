import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gale/common/app_text_styles.dart';
import 'package:intl/intl.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_text.dart';
import '../../../core/models/weather_forecast.dart';

class WeatherForecastWidget extends StatefulWidget {
  final Forecast e;

  const WeatherForecastWidget({Key? key, required this.e}) : super(key: key);

  @override
  _WeatherForecastWidgetState createState() => _WeatherForecastWidgetState();
}

class _WeatherForecastWidgetState extends State<WeatherForecastWidget> {
  String newDay = "24:00";

  String forecastTitle() {
    if (DateFormat(AppText.kkMm)
            .format(DateTime.parse(widget.e.dtTxt!))
            .toString() ==
        newDay) {
      if (widget.e.dtTxt!.contains(newDay[0])) {
        return DateFormat(AppText.e).format(DateTime.parse(widget.e.dtTxt!));
      } else {
        return DateFormat(AppText.ddMM).format(DateTime.parse(widget.e.dtTxt!));
      }
    } else {
      return DateFormat(AppText.kkMm).format(DateTime.parse(widget.e.dtTxt!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(left: 5,right:5,bottom: 10, top: 5),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    color: AppColors.blackTextColor.withOpacity(0.3),
                    offset: const Offset(-2, 2),
                    blurRadius: 5)
              ]
          ),
          child: Column(children: [
            Text(forecastTitle(),
                style: AppTextStyles.forecastCartTitleTextStyle),
            Text('${widget.e.main!.temp!.toInt().toString()}°',
                style: AppTextStyles.forecastCartSubtitleTextStyle),
            Row(
                children: widget.e.weather!
                    .map((q) => CachedNetworkImage(
                        imageUrl:
                            '${AppText.imgLink}${q.icon.toString()}${AppText.imgPngLink}'))
                    .toList()),
            Text('${widget.e.wind!.speed.toString()}' ' ${AppText.mS}',
                style: AppTextStyles.forecastCartEndTitleTextStyle)
          ]))
    ]);
  }
}