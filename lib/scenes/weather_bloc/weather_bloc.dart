import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
  }

  Future<void> _onWeatherCityEvent(
      WeatherCityEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
  }
}
