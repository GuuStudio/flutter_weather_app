
import 'package:weather/models/weather_main_model.dart';
import 'package:weather/models/weather_model.dart';

class WeatherMultiDayData {
  Weather weather;
  Main main;
  String dt;

  WeatherMultiDayData({
    required this.weather,
    required this.main,
    required this.dt,
  });

  Map<String, dynamic> toMap() {
    return {
      'weather': this.weather,
      'main': this.main,
      'dt': this.dt,
    };
  }

  @override
  String toString() {
    return 'WeatherMultiDayData{weather: $weather, main: $main, dt: $dt}';
  }

  factory WeatherMultiDayData.fromMap(Map<String, dynamic> map) {
    return WeatherMultiDayData(
      weather: Weather.fromMap( map['weather'][0] ),
      main: Main.fromMap(map['main']),
      dt: map['dt_txt'] as String,
    );
  }
}