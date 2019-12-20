
import 'dart:core';

class BaseTable {
  Map<String, dynamic> getPrimaryKey() => {};
  Map<String, dynamic> toMap() => {};
}

class States implements BaseTable {
  int id;
  int feeling;
  int condition;
  bool ateBreakfast;
  bool ateLunch;
  bool ateDinner;
  bool ateSnack;
  List<GoodPoints> goodPoints;
  List<BadPoints> badPoints;
  List<Others> oterhs;

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };
  
  Map<String, dynamic> toMap() => {
    "id": id,
    "feeling": feeling,
    "condition": condition,
    "ateBreakfast": ateBreakfast,
    "ateLunch": ateLunch,
    "ateDinner": ateDinner,
    "ateSnack": ateSnack,
  };
}

class GoodPoints implements BaseTable {
  int id;
  int stateId;
  String point;

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };

  Map<String, dynamic> toMap() => {
    "id": id,
    "stateId": stateId,
    "point": point,
  };
}

class BadPoints implements BaseTable {
  int id;
  int stateId;
  String point;

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };

  Map<String, dynamic> toMap() => {
    "id": id,
    "stateId": stateId,
    "point": point,
  };
}

class Others implements BaseTable {
  int id;
  int stateId;
  String other;

  Map<String, dynamic> getPrimaryKey() => {
    "id": id,
  };

  Map<String, dynamic> toMap() => {
    "id": id,
    "stateId": stateId,
    "other": other,
  };
}