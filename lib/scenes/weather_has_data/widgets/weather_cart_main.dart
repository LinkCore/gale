import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_text.dart';
import '../../../common/app_text_styles.dart';
import '../../weather_bloc/weather_bloc.dart';

class WeatherCartMain extends StatefulWidget {
  final WeatherHasDataState state;

  const WeatherCartMain({Key? key, required this.state}) : super(key: key);

  @override
  _WeatherCartMainState createState() => _WeatherCartMainState();
}

class _WeatherCartMainState extends State<WeatherCartMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors.blackTextColor.withOpacity(0.3),
                  offset: const Offset(-2, 2),
                  blurRadius: 5)
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CachedNetworkImage(
                    imageUrl: widget.state.weather.iconUrl,
                    width: 115,
                    height: 115),
                Container(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 2.25,
                    margin: const EdgeInsets.only(left: 5),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                            widget.state.weather.weather!.first.description
                                .toString(),
                            style: AppTextStyles
                                .weatherCartMainDescriptionTextStyle)))
              ]),
              const Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${widget.state.weather.main!.temp.toString()}°',
                    style: AppTextStyles.weatherCartMainTempTextStyle),
                Text(
                    '${AppText.feelsLike} ${widget.state.weather.main!.feelsLike.toString()}°',
                    style: AppTextStyles.weatherCartMainFeelsLikeTextStyle)
              ])
            ]));
  }
}