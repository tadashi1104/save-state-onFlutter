
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:save_state_on_flutter/models/model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  dynamic initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "StateDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      db.execute("CREATE TABLE States ("
          "id INTEGER PRIMARY KEY,"
          "feeling INTEGER,"
          "condition INTEGER,"
          "ateBreakFast BIT,"
          "ateLunch BIT,"
          "ateDinner BIT,"
          "ateSnack BIT,"
          "other TEXT,"
          "insertDateTime TEXT"
          ")");
      db.execute("CREATE TABLE GoodPoints ("
          "id INTEGER PRIMARY KEY,"
          "stateId INTEGER,"
          "point TEXT"
          ")");
      db.execute("CREATE TABLE BadPoints ("
          "id INTEGER PRIMARY KEY,"
          "stateId INTEGER,"
          "point TEXT"
          ")");
    });
  }

  Future<List<States>> getState() async {
    
    final Database db = await database;
    // var tempStates = await db.rawQuery("Select * From States Where insertDateTime Like '$date%'");
    var tempStates = await db.query('States', 
      orderBy: 'insertDateTime Desc'
    );

    List<States> states = new List<States>();
    for (var state in tempStates) {
      Map<String, dynamic> _state = Map<String, dynamic>.from(state);
      List<GoodPoints> goodPoints = new List<GoodPoints>();
      var tempGoodPoints = await db.query("GoodPoints", where: "stateId = ?", whereArgs: [state["id"]]);
      tempGoodPoints.forEach((goodPoint) => goodPoints.add(GoodPoints.fromMap(goodPoint)));
      List<BadPoints> badPoints = new List<BadPoints>();
      var tempBadPoints = await db.query("BadPoints", where: "stateId = ?", whereArgs: [state["id"]]);
      tempBadPoints.forEach((badPoint) => badPoints.add(BadPoints.fromMap(badPoint)));
      _state['GoodPoints'] = goodPoints;
      _state['BadPoints'] = badPoints;
      states.add(States.fromMap(_state));
    }

    return states;

  }

  Future<Map<String, dynamic>> getStateForId(int id) async {

    final Database db = await database;
    // var tempStates = await db.rawQuery("Select * From States Where insertDateTime Like '$date%'");
    var states = await db.query('States', 
      where: "id = ?",
      whereArgs: [id]
    );

    return states.first;

  } 

  Future<List<States>> getStateForDate(String date) async {

    final Database db = await database;
    // var tempStates = await db.rawQuery("Select * From States Where insertDateTime Like '$date%'");
    var tempStates = await db.query('States', 
      where: "insertDateTime Like '$date%'"
    );

    List<States> states = new List<States>();
    for (var state in tempStates) {
      Map<String, dynamic> _state = Map<String, dynamic>.from(state);
      List<GoodPoints> goodPoints = new List<GoodPoints>();
      var tempGoodPoints = await db.query("GoodPoints", where: "stateId = ?", whereArgs: [state["id"]]);
      tempGoodPoints.forEach((goodPoint) => goodPoints.add(GoodPoints.fromMap(goodPoint)));
      List<BadPoints> badPoints = new List<BadPoints>();
      var tempBadPoints = await db.query("BadPoints", where: "stateId = ?", whereArgs: [state["id"]]);
      tempBadPoints.forEach((badPoint) => badPoints.add(BadPoints.fromMap(badPoint)));
      _state['GoodPoints'] = goodPoints;
      _state['BadPoints'] = badPoints;
      states.add(States.fromMap(_state));
    }

    return states;

  } 

  Future<void> insertState(States state) async {
    final Database db = await database;
    var max = await db.rawQuery("SELECT MAX(id)+1 as id FROM States");
    state.id = max.first["id"] == null ? 1 : max.first["id"];
    db.insert(
      "States",
      state.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    state.goodPoints.forEach((goodPoint) => {insertGoodPoint(goodPoint, state.id)});
    state.badPoints.forEach((badPoint) => {insertBadPoint(badPoint, state.id)});
  }

  Future<void> insertGoodPoint(GoodPoints item, int stateId) async {
    final Database db = await database;
    var max = await db.rawQuery("SELECT MAX(id)+1 as id FROM GoodPoints Where stateId = ?",
        [stateId]);
    item.id = max.first["id"] == null ? 1 : max.first["id"];
    item.stateId = stateId;
    db.insert(
      "GoodPoints",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertBadPoint(BadPoints item, int stateId) async {
    final Database db = await database;
    var max = await db.rawQuery("SELECT MAX(id)+1 as id FROM BadPoints Where stateId = ?",
        [stateId]);
    item.id = max.first["id"] == null ? 1 : max.first["id"];
    item.stateId = stateId;
    db.insert(
      "BadPoints",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateState(States state) async {
    final db = await database;
    db.update(
      "States",
      state.toMap(),
      where: "id = ?",
      whereArgs: [state.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );

    int stateId = state.id;
    state.goodPoints.forEach((goodPoint) => {
      if (goodPoint.id == null) {
        insertGoodPoint(goodPoint, stateId)
      } else {
        updateGoodPoint(goodPoint)
      }
    });
    state.badPoints.forEach((badPoint) => {
      if (badPoint.id == null) {
        insertBadPoint(badPoint, stateId)
      } else {
        updateBadPoint(badPoint)
      }
    });
  }

  Future<void> updateGoodPoint(GoodPoints goodPoint) async {
    final Database db = await database;
    db.update(
      "GoodPoints",
      goodPoint.toMap(),
      where: "id = ?",
      whereArgs: [goodPoint.id]
    );
  }

  Future<void> updateBadPoint(BadPoints badPoint) async {
    final Database db = await database;
    db.update(
      "BadPoints",
      badPoint.toMap(),
      where: "id = ?",
      whereArgs: [badPoint.id]
    );
  }
}