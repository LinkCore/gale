part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherStartupEvent extends WeatherEvent{}

class WeatherCityEvent extends WeatherEvent{
  final String city;

  WeatherCityEvent({required this.city});
}