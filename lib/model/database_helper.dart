import 'dart:io';

import 'package:catatan_lembur/model/cat.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = 'cat_database.db';
  static const _databaseVersion = 1;

  // Singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    print(dbPath);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute('CREATE TABLE ${Cat.tblCats}('
        '${Cat.colId} INTEGER PRIMARY KEY AUTOINCREMENT,'
        '${Cat.colActHours} DOUBLE NOT NULL,'
        '${Cat.colTotalHours} DOUBLE NOT NULL)'
        '${Cat.colDateTime} TEXT NOT NULL,'
        '${Cat.colNote} TEXT NOT NULL');
  }

  // Insert
  Future<int> insertCat(Cat cat) async {
    Database db = await database;
    return await db.insert(Cat.tblCats, cat.toMap());
  }

  // Update
  Future<int> updateCat(Cat cat) async {
    Database db = await database;
    return await db.update(Cat.tblCats, cat.toMap(),
        where: '${Cat.colId}=?', whereArgs: [cat.id]);
  }

  // Delete
  Future<int> deleteCat(int id) async {
    Database db = await database;
    return await db
        .delete(Cat.tblCats, where: '${Cat.colId}=?', whereArgs: [id]);
  }

  // Retrieve all
  Future<List<Cat>> fetchCat() async {
    Database db = await database;
    List<Map> cats = await db.query(Cat.tblCats);
    return cats.length == 0 ? [] : cats.map((x) => Cat.fromMap(x)).toList();
  }
}
