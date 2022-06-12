import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/common/app_colors.dart';
import 'package:gale/common/app_text_styles.dart';
import 'package:gale/scenes/theme/theme_bloc/theme_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';
import 'package:gale/scenes/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'package:gale/scenes/weather_has_data/weather_has_data_widget.dart';
import 'package:gale/scenes/widgets/animated_app_bar.dart';
import 'package:gale/scenes/widgets/weather_error_widget.dart';
import 'package:gale/scenes/widgets/weather_loading_widget.dart';
import 'common/app_text.dart';

class HomePage extends StatefulWidget {
  final ThemeData themeColor;

  const HomePage({Key? key, required this.themeColor}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cityTextController = TextEditingController();
  String country = '';
  String cityName = '';

  Future<void> _onGeolocationWeather() async {
    context.read<WeatherBloc>().add(WeatherStartupEvent());
    context.read<ThemeBloc>().add(ThemeStartupEvent());
    context.read<WeatherForecastBloc>().add(WeatherForecastStartupEvent());
    _cityTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(children: [
          AnimatedAppBar(
              cityTextController: _cityTextController,
              themeColor: widget.themeColor,
              cityName: cityName,
              country: country),
          BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
            if (state is WeatherHasDataState) {
              setState(() {
                country = state.weather.sys!.country.toString();
                cityName = state.weather.name.toString();
                });
              }
            }, builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const WeatherLoadingWidget();
            } else if (state is WeatherHasDataState) {
              return WeatherHasDataWidget(
                  state: state, cityTextController: _cityTextController.text);
            } else if (state is WeatherErrorState) {
              return WeatherErrorWidget(state: state);
            } else {
              return Text(AppText.errorState,
                  style: AppTextStyles.appBarCityNameTextStyle);
            }})]),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 5),
            child: InkWell(
                child: const Icon(Icons.location_searching,
                    size: 32, color: AppColors.blackTextColor),
                onTap: _onGeolocationWeather)));
  }
}
