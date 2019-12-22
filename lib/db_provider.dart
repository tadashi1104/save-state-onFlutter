
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
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      db.execute("CREATE TABLE States ("
          "id INTEGER PRIMARY KEY,"
          "feering INTEGER,"
          "condition INTEGER,"
          "ateBreakFast BIT,"
          "ateLunch BIT,"
          "ateDinner BIT,"
          "ateSnack BIT,"
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
      db.execute("CREATE TABLE Others ("
          "id INTEGER PRIMARY KEY,"
          "stateId INTEGER,"
          "other TEXT"
          ")");
    });
  }

  Future<void> insertState(States item) async {
    final Database db = await database;
    var max = await db.rawQuery("SELECT MAX(id)+1 as id FROM States");
    item.id = max.length == 0 ? 1 : max.first["id"];
    db.insert(
      "States",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    item.goodPoints.forEach((goodPoint) => {insertGoodPoint(goodPoint, item.id)});
    item.badPoints.forEach((badPoint) => {insertBadPoint(badPoint, item.id)});
    item.others.forEach((other) => {insertOther(other, item.id)});
  }

  Future<void> insertGoodPoint(GoodPoints item, int stateId) async {
    final Database db = await database;
    var max = await db.rawQuery("SELECT MAX(id)+1 as id FROM GoodPoints Where stateId = ?",
        [stateId]);
    item.id = max.length == 0 ? 1 : max.first["id"];
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
    item.id = max.length == 0 ? 1 : max.first["id"];
    item.stateId = stateId;
    db.insert(
      "BadPonts",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertOther(Others item, int stateId) async {
    final Database db = await database;
    var max = await db.rawQuery("SELECT MAX(id)+1 as id FROM Others Where stateId = ?",
        [stateId]);
    item.id = max.length == 0 ? 1 : max.first["id"];
    item.stateId = stateId;
    db.insert(
      "Others",
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateState(States item, String id) async {
    final db = await database;
    db.update(
      "States",
      item.toMap(),
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }
}