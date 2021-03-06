import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../core/models/weather_model.dart';
import '../../core/service/geolocation_service.dart';
import '../../core/service/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherStartupEvent>(_onWeatherStartupEvent);
    on<WeatherCityEvent>(_onWeatherCityEvent);
  }

  Future<void> _onWeatherStartupEvent(
      WeatherStartupEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      Position geoLocation = await GeolocationProvider().determinePosition();
      final WeatherNow weather = await WeatherService().getWeatherNow(
          geoLocation.latitude.toString(), geoLocation.longitude.toString());
      emit(WeatherHasDataState(weather: weather));
    } on Exception catch (e) {
      emit(WeatherErrorState(errorCode: e.toString()));
    }
  }

  Future<void> _onWeatherCityEvent(
      WeatherCityEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      final WeatherNow weatherByCity =
          await WeatherService().getWeatherByCity(event.city);
      emit(WeatherHasDataState(weather: weatherByCity));
    } on Exception catch (e) {
      emit(WeatherErrorState(errorCode: e.toString()));
    }
  }
}