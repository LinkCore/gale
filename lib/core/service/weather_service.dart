import 'dart:convert';

import 'package:http/http.dart';
import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherNow> getWeatherNow(String lat, String lon) async {
    final response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=92aae42e0334d07dd97322a4cc4a058e&units=metric'));

    final weather = WeatherNow.fromJson(jsonDecode(response.body));
    return weather;
  }

  Future<WeatherNow> getWeatherByCity(String city) async {

    final response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=92aae42e0334d07dd97322a4cc4a058e&units=metric'));
    if (response.statusCode == 200) {
      final weather = WeatherNow.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      return throw Exception(response.statusCode);
    }
  }
}
