import 'dart:convert';
import 'package:http/http.dart';
import '../../common/app_text.dart';
import '../models/weather_forecast.dart';

class WeatherForecastService {
  final String key = AppText.apiKey;
  final String link = AppText.apiWeatherForecastLink;
  final String units = AppText.units;

  Future<WeatherForecast> getWeatherForecast(String lat, String lon) async {
    final response =
        await get(Uri.parse('$link&lat=$lat&lon=$lon&appid=$key&$units'));
    if (response.statusCode == 200) {
      final weatherForecast =
          WeatherForecast.fromJson(jsonDecode(response.body));
      return weatherForecast;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<WeatherForecast> getWeatherForecastByCity(String city) async {
    final response = await get(Uri.parse('${link}q=$city&appid=$key&$units'));
    if (response.statusCode == 200) {
      final weatherForecast =
          WeatherForecast.fromJson(jsonDecode(response.body));
      return weatherForecast;
    } else {
      return throw Exception(response.statusCode);
    }
  }
}