
import 'dart:core';
import 'dart:convert';

class States {
  int id;
  int feeling;
  int condition;
  bool ateBreakfast;
  bool ateLunch;
  bool ateDinner;
  bool ateSnack;
  List<GoodPoints> goodPoints;
  List<BadPoints> badPoints;
  String other;

  States({
    this.id,
    this.feeling,
    this.condition,
    this.ateBreakfast,
    this.ateLunch,
    this.ateDinner,
    this.ateSnack,
    this.goodPoints,
    this.badPoints,
    this.other,
  });

  factory States.fromMap(Map<String, dynamic> json) => new States(
    id: json["id"],
    feeling: json["feeling"],
    condition: json["condition"],
    ateBreakfast: json["ateBreakfast"],
    ateLunch: json["ateLunch"],
    ateSnack: json["ateSnack"],
    goodPoints: json["goodPoints"],
    badPoints: json["badPoints"],
    other: json["other"],
  );
  
  Map<String, dynamic> toMap() => {
    "id": id,
    // "feeling": feeling,
    "condition": condition,
    "ateBreakfast": ateBreakfast,
    "ateLunch": ateLunch,
    "ateDinner": ateDinner,
    "ateSnack": ateSnack,
    "other" :other
  };

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };
}

class StatesConvert {

  States fromJson(String str) {
    final jsonData = json.decode(str);
    return States.fromMap(jsonData);
  }

  String toJson(States data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }
}

class GoodPoints {
  int id;
  int stateId;
  String point;

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };

  GoodPoints({
    this.id,
    this.stateId,
    this.point,
  });

  factory GoodPoints.fromMap(Map<String, dynamic> json) => new GoodPoints(
    id: json["id"],
    stateId: json["stateId"],
    point: json["point"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "stateId": stateId,
    "point": point,
  };
}

class BadPoints {
  int id;
  int stateId;
  String point;

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };

  BadPoints({
    this.id,
    this.stateId,
    this.point,
  });

  factory BadPoints.fromMap(Map<String, dynamic> json) => new BadPoints(
    id: json["id"],
    stateId: json["stateId"],
    point: json["point"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "stateId": stateId,
    "point": point,
  };
}