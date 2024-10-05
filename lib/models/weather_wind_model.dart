class Wind {
  num speed;
  num deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  Map<String, dynamic> toJson() {
    return {
      "speed": speed,
      "deg": deg,
    };
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json["speed"] as num,
      deg: json["deg"] as num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as num,
      deg: map['deg'] as num,
    );
  }
//
}