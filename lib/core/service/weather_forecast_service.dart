import 'dart:convert';
import 'package:http/http.dart';
import '../models/weather_forecast.dart';

class WeatherForecastService {
  Future<WeatherForecast> getWeatherForecast(String lat, String lon) async {
    final response = await get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?&lat=$lat&lon=$lon&appid=92aae42e0334d07dd97322a4cc4a058e&units=metric'));
    if(response.statusCode == 200) {
      final weatherForecast = WeatherForecast.fromJson(
          jsonDecode(response.body));
      return weatherForecast;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<WeatherForecast> getWeatherForecastByCity(String city) async {
    final response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=92aae42e0334d07dd97322a4cc4a058e&units=metric'));
    if (response.statusCode == 200) {
      final weatherForecast = WeatherForecast.fromJson(jsonDecode(response.body));
      return weatherForecast;
    } else {
      return throw Exception(response.statusCode);
    }
  }
}