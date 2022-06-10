import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../core/models/weather_forecast.dart';
import '../../core/service/geolocation_service.dart';
import '../../core/service/weather_forecast_service.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitial()) {
    on<WeatherForecastStartupEvent>(_onWeatherForecastStartupEvent);
    on<WeatherForecastCityEvent>(_onWeatherForecastCityEvent);
  }

  Future<void> _onWeatherForecastStartupEvent(
      WeatherForecastStartupEvent event, Emitter<WeatherForecastState> emit) async {
    emit(WeatherForecastLoadingState());
    Position geoLocation = await GeolocationProvider().determinePosition();
    final WeatherForecast weatherForecast = await WeatherForecastService().getWeatherForecast(geoLocation.latitude.toString(), geoLocation.longitude.toString());
    emit(WeatherForecastHasDataState(weatherForecast: weatherForecast));
  }

  Future<void> _onWeatherForecastCityEvent(
      WeatherForecastCityEvent event, Emitter<WeatherForecastState> emit) async {
    emit(WeatherForecastLoadingState());
    try {
      final WeatherForecast weatherForecastByCity = await WeatherForecastService().getWeatherForecastByCity(event.city);

      emit(WeatherForecastHasDataState(weatherForecast: weatherForecastByCity));
    } on Exception catch (e){
      emit(WeatherForecastErrorState(errorCode: e.toString()));
    }
  }
}
