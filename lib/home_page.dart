import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';
import 'package:gale/scenes/widgets/weather_error_widget.dart';
import 'package:gale/scenes/widgets/weather_has_data_widget.dart';
import 'package:gale/scenes/widgets/weather_initial_widget.dart';
import 'package:gale/scenes/widgets/weathre_loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String country = '';
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFf2f4f7),
            elevation: 0,
            centerTitle: true,
            title: Row(mainAxisSize: MainAxisSize.min, children: [
              Text('$country, ',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              Text(cityName,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400))
            ])),
        body: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
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
            return const WeatherHasDataWidget();
          } else if (state is WeatherErrorState) {
            return const WeatherErrorWidget();
          } else {
            return const WeatherInitialWidget();
          }
        }));
  }
}
