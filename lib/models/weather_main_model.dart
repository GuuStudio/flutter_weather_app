class Main {
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num pressure;
  num humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as num,
      feelsLike: map['feels_like'] as num,
      tempMin: map['temp_min'] as num,
      tempMax: map['temp_max'] as num,
      pressure: map['pressure'] as num,
      humidity: map['humidity'] as num,
    );
  }

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: num.parse(json["temp"]),
      feelsLike: num.parse(json["feels_like"]),
      tempMin: num.parse(json["temp_min"]),
      tempMax: num.parse(json["temp_max"]),
      pressure: json["pressure"] as num,
      humidity: json["humidity"] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
      "feels_like": feelsLike,
      "temp_min": tempMin,
      "temp_max": tempMax,
      "pressure": pressure,
      "humidity": humidity,
    };
  }

//
}