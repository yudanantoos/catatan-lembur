import 'cat.dart';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart';


class MyCrud {

  DatabaseHelper _databaseHelper;

  MyCrud() {
    _databaseHelper = DatabaseHelper.instance;
  }

  // Insert
  Future<int> insertCat(Cat cat) async {
    Database db = await _databaseHelper.database;
    return await db.insert(Cat.tblCats, cat.toMap());
  }

  // Update
  Future<int> updateCat(Cat cat) async {
    Database db = await _databaseHelper.database;
    return await db.update(Cat.tblCats, cat.toMap(),
        where: '${Cat.colId}=?', whereArgs: [cat.id]);
  }

  // Delete
  Future<int> deleteCat(int id) async {
    Database db = await _databaseHelper.database;
    return await db
        .delete(Cat.tblCats, where: '${Cat.colId}=?', whereArgs: [id]);
  }

  // Retrieve all
  Future<List<Cat>> fetchCat() async {
    Database db = await _databaseHelper.database;
    List<Map> cats = await db.query(Cat.tblCats);
    return cats.length == 0 ? [] : cats.map((x) => Cat.fromMap(x)).toList();
  }
}
