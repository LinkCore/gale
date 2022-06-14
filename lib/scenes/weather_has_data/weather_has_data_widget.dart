import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/weather_has_data/widgets/weather_cart_description.dart';
import 'package:gale/scenes/weather_has_data/widgets/weather_cart_main.dart';
import 'package:gale/scenes/weather_has_data/widgets/weather_forecast.dart';

import '../../common/app_colors.dart';
import '../../common/app_text.dart';
import '../theme/theme_bloc/theme_bloc.dart';
import '../weather_bloc/weather_bloc.dart';
import '../weather_forecast_bloc/weather_forecast_bloc.dart';

class WeatherHasDataWidget extends StatefulWidget {
  final WeatherHasDataState state;
  final String cityTextController;

  const WeatherHasDataWidget(
      {Key? key, required this.state, required this.cityTextController})
      : super(key: key);

  @override
  State<WeatherHasDataWidget> createState() => _WeatherHasDataWidgetState();
}

class _WeatherHasDataWidgetState extends State<WeatherHasDataWidget> {
  Future<void> _onRefresh() async {

    await Future.delayed(const Duration(milliseconds: 425));
    if (widget.cityTextController.isEmpty) {
      context.read<ThemeBloc>().add(ThemeStartupEvent());
      context.read<WeatherBloc>().add(WeatherStartupEvent());
      context.read<WeatherForecastBloc>().add(WeatherForecastStartupEvent());
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      context.read<ThemeBloc>().add(ThemeCityEvent(city: widget.cityTextController));
      context.read<WeatherBloc>().add(WeatherCityEvent(city: widget.cityTextController));
      context.read<WeatherForecastBloc>().add(WeatherForecastCityEvent(city: widget.cityTextController));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
            onRefresh: _onRefresh,
            color: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: AppColors.whiteTextColor,
            child: ListView(children: [
              WeatherCartMain(state: widget.state),
              WeatherCartDescription(state: widget.state),
              BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
                  builder: (context, state) {
                if (state is WeatherForecastLoadingState) {
                  return const SizedBox();
                } else if (state is WeatherForecastHasDataState) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                              children: state.weatherForecast.forecast!
                                  .map((e) => WeatherForecastWidget(e: e))
                                  .toList())));
                } else if (state is WeatherForecastErrorState) {
                  return Text(state.errorCode);
                } else {
                  return Text(AppText.error);
                }
              })
            ])));
  }
}