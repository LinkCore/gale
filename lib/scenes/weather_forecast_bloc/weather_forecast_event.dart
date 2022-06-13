part of 'weather_forecast_bloc.dart';

@immutable
abstract class WeatherForecastEvent {}

class WeatherForecastStartupEvent extends WeatherForecastEvent {}

class WeatherForecastCityEvent extends WeatherForecastEvent {
  final String city;

  WeatherForecastCityEvent({required this.city});
}