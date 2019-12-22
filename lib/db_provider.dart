
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

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE States ("
          "id INTEGER PRIMARY KEY,"
          "feering INTEGER,"
          "condition INTEGER,"
          "ateBreakFast BIT,"
          "ateLunch BIT,"
          "ateDinner BIT,"
          "ateSnack BIT,"
          ")");
      await db.execute("CREATE TABLE GoodPoints ("
          "id INTEGER PRIMARY KEY,"
          "stateId INTEGER,"
          "point TEXT"
          ")");
      await db.execute("CREATE TABLE BadPoints ("
          "id INTEGER PRIMARY KEY,"
          "stateId INTEGER,"
          "point TEXT"
          ")");
      await db.execute("CREATE TABLE Others ("
          "id INTEGER PRIMARY KEY,"
          "stateId INTEGER,"
          "other TEXT"
          ")");
    });
  }

  Future<int> insert(String table, BaseTable item) async {
    final Database db = await database;
    return db.insert(
      table,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> update(String table, String key, BaseTable item) async {
    final db = await database;
    var keys = item.getPrimaryKey();
    String condition;
    keys.forEach( (key, value) => {condition = "$condition${condition == null ? null : ","} = ?"} );
    await db.update(
      table,
      item.toMap(),
      where: condition,
      whereArgs: [keys],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  T getAll<T>(String table) async {
    final db = await database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? 


}