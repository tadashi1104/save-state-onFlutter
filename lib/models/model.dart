
import 'dart:core';

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
  List<Others> oterhs;
}

class GoodPoints {
  int id;
  int stateId;
  String goodPoint;
}

class BadPoints {
  int id;
  int stateId;
  String badPoint;
}

class Others {
  int id;
  int stateId;
  String other;
}