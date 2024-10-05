import 'dart:convert';

import 'package:weather/models/weather_main_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/weather_wind_model.dart';

class WeatherCurrentData {
  num id;
  List<Weather> weathers;
  String base;
  Main main ;
  num visibility;
  Wind wind;
  String name;
  num cod;

  @override
  String toString() {
    return 'WeatherData{id: $id, weathers: ${weathers.toString()}, base: $base, main: $main, visibility: $visibility, wind: $wind, name: $name, cod: $cod}';
  }

  WeatherCurrentData({
    required this.id,
    required this.weathers,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.name,
    required this.cod,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "weathers": jsonEncode(weathers),
      "base": base,
      "main": main,
      "visibility": visibility,
      "wind": wind,
      "name": name,
      "cod": cod,
    };
  }

  factory WeatherCurrentData.fromJson(Map<String, dynamic> json) {
    return WeatherCurrentData(
      id: json["id"] as num,
      weathers:
      List.of(json["weather"]).map((i) => Weather.fromJson(i) /* can't generate it properly yet */).toList(),
      base: json["base"],
      main: Main.fromJson(json["main"]),
      visibility: num.parse(json["visibility"]),
      wind: Wind.fromJson(json["wind"]),
      name: json["name"],
      cod: num.parse(json["cod"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weathers': weathers,
      'base': base,
      'main': main,
      'visibility': visibility,
      'wind': wind,
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherCurrentData.fromMap(Map<String, dynamic> map) {
    return WeatherCurrentData(
      id: map['id'] as num,
      weathers: List.of(map["weather"]).map((i) => Weather.fromMap(i) ).toList(),
      base: map['base'] as String,
      main: Main.fromMap(map['main'] as Map<String, dynamic>) ,
      visibility: map['visibility'] as num,
      wind: Wind.fromMap(map['wind'])  ,
      name: map['name'] as String,
      cod: map['cod'] as num,
    );
  }
//
}