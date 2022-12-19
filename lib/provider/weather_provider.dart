import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weather_wodel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  String? cityName;
  void changeWeatherModel(WeatherModel weatherModel) {
    this.weatherModel = weatherModel;
    notifyListeners();
  }

  void changeCityNme(String? cityName) {
    this.cityName = cityName;
    notifyListeners();
  }
}

