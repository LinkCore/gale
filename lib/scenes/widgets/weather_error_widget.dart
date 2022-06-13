import 'package:flutter/material.dart';
import 'package:gale/common/app_text_styles.dart';

import '../../common/app_text.dart';
import '../weather_bloc/weather_bloc.dart';

class WeatherErrorWidget extends StatelessWidget {
  final WeatherErrorState state;

  const WeatherErrorWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('${AppText.error} ${state.errorCode}',
              style: AppTextStyles.errorTextStyle)
        ]));
  }
}