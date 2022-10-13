import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utils/my_string.dart';

import '../model/weather_wodel.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather(
      String? cityName, BuildContext context) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no'));
      if (response.statusCode == 200) {
        return weatherModelFromJson(response.body);
      } else {
        return throw Exception("Failed to load weather data");
      }
    } catch (error) {
      return null;
    }
  }
}
