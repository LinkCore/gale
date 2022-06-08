import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gale/common/app_theme.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/models/weather_model.dart';
import '../../../core/service/geolocation_service.dart';
import '../../../core/service/weather_service.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeStartupEvent>(_onThemeOnStartupEvent);
  }

  Future<void> _onThemeOnStartupEvent(
      ThemeStartupEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoadingState());
    Position geoLocation = await GeolocationProvider().determinePosition();
    final WeatherNow weather = await WeatherService().getWeatherNow(
        geoLocation.latitude.toString(), geoLocation.longitude.toString());

    String description = weather.weather!.first.description.toString();

    Map<String, ThemeHasDataState> mapStringToTheme = {
      'clear sky': ThemeHasDataState(currentTheme: AppTheme.clearSkyTheme),
      'few clouds': ThemeHasDataState(currentTheme: AppTheme.fewCloudsTheme),
      'scattered clouds': ThemeHasDataState(currentTheme: AppTheme.scatteredCloudsTheme),
      'broken clouds': ThemeHasDataState(currentTheme: AppTheme.brokenCloudsTheme),
      'shower rain': ThemeHasDataState(currentTheme: AppTheme.showerRainTheme),
      'rain': ThemeHasDataState(currentTheme: AppTheme.rainTheme),
      'thunderstorm': ThemeHasDataState(currentTheme: AppTheme.thunderstormTheme),
      'snow': ThemeHasDataState(currentTheme: AppTheme.snowTheme),
      'mist': ThemeHasDataState(currentTheme: AppTheme.mistTheme)
    };
    if(mapStringToTheme.containsKey(description)){
    emit(mapStringToTheme[description]!);
    } else {
      emit(ThemeErrorState(errorCode: e.toString()));
    }
  }
}
