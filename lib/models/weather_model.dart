class Weather {
  num id;
  String main;
  String description;


  @override
  String toString() {
    return 'Weather{id: $id, main: $main, description: $description}';
  }

  Weather({
    required this.id,
    required this.main,
    required this.description,

  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "main": main,
      "description": description,
    };
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"] as num,
      main: json["main"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as num,
      main: map['main'] as String,
      description: map['description'] as String,
    );
  } //
}



