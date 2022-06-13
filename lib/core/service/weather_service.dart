import 'dart:convert';
import 'package:http/http.dart';
import '../../common/app_text.dart';
import '../models/weather_model.dart';

class WeatherService {
  final String key = AppText.apiKey;
  final String link = AppText.apiWeatherLink;
  final String units = AppText.units;

  Future<WeatherNow> getWeatherNow(String lat, String lon) async {
    final response =
        await get(Uri.parse('${link}lat=$lat&lon=$lon&appid=$key&$units'));
    final weather = WeatherNow.fromJson(jsonDecode(response.body));
    return weather;
  }

  Future<WeatherNow> getWeatherByCity(String city) async {
    final response = await get(Uri.parse('${link}q=$city&appid=$key&$units'));
    if (response.statusCode == 200) {
      final weather = WeatherNow.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      return throw Exception(response.statusCode);
    }
  }
}