import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';

import 'home_page.dart';

class GaleApp extends StatelessWidget {
  const GaleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherBloc()..add(WeatherStartupEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
