import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';
import 'package:gale/scenes/weather_forecast_bloc/weather_forecast_bloc.dart';

import 'home_page.dart';

class GaleApp extends StatelessWidget {
  const GaleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WeatherBloc()..add(WeatherStartupEvent())),
        BlocProvider(
            create: (context) => WeatherForecastBloc()..add(WeatherForecastStartupEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.black87),
        home: const HomePage(),
      ),
    );
  }
}
