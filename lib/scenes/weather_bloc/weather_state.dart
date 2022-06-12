part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherHasDataState extends WeatherState {
  final WeatherNow weather;

  WeatherHasDataState({required this.weather});
}

class WeatherErrorState extends WeatherState {
  final String errorCode;

  WeatherErrorState({required this.errorCode});
}