import 'package:dio/dio.dart';
import 'package:weather/apps/utils/constants.dart';
import 'package:weather/models/weather_days_data.dart';
import '../models/weather_current_data.dart';

class ApiRepository {
  static Future<WeatherCurrentData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=16.034377&units=metric&lon=108.221643&appid=${MyKey.apiToken}');
      if (res.statusCode == 200) {
        final data = res.data;
        WeatherCurrentData result = WeatherCurrentData.fromMap(data);
        return result;
      } else {
        throw Exception('Cant call api: status (${res.statusCode})');
      }
    } catch (e) {
      throw Exception('Cant call api ${e.toString()}');
    }
  }

  static Future<List<WeatherMultiDayData>> callApiGetMultiDayWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=16.034377&units=metric&lon=108.221643&appid=${MyKey.apiToken}');
      try {
        final List<dynamic> data = res.data["list"] as List<dynamic>;

        final List<WeatherMultiDayData> result = data.map((item) {
          return WeatherMultiDayData.fromMap(item as Map<String, dynamic>);
        }).toList();
        return result;
      } catch (e) {

        rethrow; //
      }
    } catch (e) {
      throw Exception('Cant call api');
    }
  }
}
