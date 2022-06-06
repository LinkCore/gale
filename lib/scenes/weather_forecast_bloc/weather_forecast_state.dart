part of 'weather_forecast_bloc.dart';

@immutable
abstract class WeatherForecastState {}

class WeatherForecastInitial extends WeatherForecastState {}

class WeatherForecastLoadingState extends WeatherForecastState {}

class WeatherForecastHasDataState extends WeatherForecastState {
  final WeatherForecast weatherForecast;

  WeatherForecastHasDataState({required this.weatherForecast});
}

class WeatherForecastErrorState extends WeatherForecastState {
  final String errorCode;

  WeatherForecastErrorState({required this.errorCode});
}
