import 'package:flutter/material.dart';
import 'package:weather/models/weather_days_data.dart';
import 'package:weather/repositories/api_repository.dart';
 import '../models/weather_current_data.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherCurrentData> getWeatherCurrent() async {
    WeatherCurrentData result = await ApiRepository.callApiGetWeather();
    return result;
  }
  Future<List<WeatherMultiDayData>> getWeatherMultiDay() async {
    List<WeatherMultiDayData> result = await ApiRepository.callApiGetMultiDayWeather();
    return result;
  }
}