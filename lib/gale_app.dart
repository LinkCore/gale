import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/common/app_theme.dart';
import 'package:gale/scenes/theme/theme_bloc/theme_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';
import 'package:gale/scenes/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'home_page.dart';

class GaleApp extends StatefulWidget {
  const GaleApp({Key? key}) : super(key: key);

  @override
  State<GaleApp> createState() => _GaleAppState();
}

class _GaleAppState extends State<GaleApp> {
  ThemeData themeColor = AppTheme.clearSkyTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ThemeBloc()..add(ThemeStartupEvent())),
          BlocProvider(
              create: (context) => WeatherBloc()..add(WeatherStartupEvent())),
          BlocProvider(
              create: (context) =>
                  WeatherForecastBloc()..add(WeatherForecastStartupEvent()))
        ],
        child: BlocListener<ThemeBloc, ThemeState>(
            listener: (context, state) {
              if (state is ThemeHasDataState) {
                setState(() {
                  themeColor = state.currentTheme;
                });
              }
            },
            child: MaterialApp(
                theme: themeColor,
                debugShowCheckedModeBanner: false,
                home: HomePage(themeColor: themeColor))));
  }
}