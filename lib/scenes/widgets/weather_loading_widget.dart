import 'package:flutter/material.dart';
import 'package:gale/common/app_colors.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
        CircularProgressIndicator(color: AppColors.cartColor)
      ])
    );
  }
}
