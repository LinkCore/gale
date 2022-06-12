import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gale/common/app_text_styles.dart';
import 'package:intl/intl.dart';

import '../../../common/app_text.dart';
import '../../../core/models/weather_forecast.dart';

class WeatherForecastWidget extends StatefulWidget {
  final Forecast e;

  const WeatherForecastWidget({Key? key, required this.e}) : super(key: key);

  @override
  _WeatherForecastWidgetState createState() => _WeatherForecastWidgetState();
}

class _WeatherForecastWidgetState extends State<WeatherForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Text(
                DateFormat(AppText.kkMm).format(DateTime.parse(widget.e.dtTxt!)),
                style: AppTextStyles.forecastCartTitleTextStyle),
            Text('${widget.e.main!.temp!.toInt().toString()}°',
                style: AppTextStyles.forecastCartSubtitleTextStyle),
            Row(children: widget.e.weather!.map((q) => CachedNetworkImage(
             imageUrl: '${AppText.imgLink}${q.icon.toString()}${AppText.imgPngLink}')).toList()),
            Text('${widget.e.wind!.speed.toString()}' ' ${AppText.mS}',
                style: AppTextStyles.forecastCartEndTitleTextStyle
            )]))]);
  }
}