import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:catatan_lembur/database/cat.dart';

class Crud {

  Future<Database> database;

  void createDB() async {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();

    // Open the database and store the reference.
    database = openDatabase(
      join(await getDatabasesPath(), 'cat_database.db'),
      // When the database is first created, create a table to store cats.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
            "CREATE TABLE cats(id INTEGER PRIMARY KEY AUTOINCREMENT, act_hours DOUBLE, total_hours DOUBLE, date_time TEXT, note TEXT"
        );
      },
      // Set the version. This execute the onCreate function and provides
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

    // Define a function that insert cats into the database.
    Future<void> insertCat(Cat cat) async {
      // Get the reference to the database
      final Database db = await database;

      // Insert the Cat into the correct table. You might also spesify the
      // 'conflictAlgorithm' to use in case the same cat is inserted twice.
      //
      // In this case, replace any previous data.
      await db.insert(
        'cats',
        cat.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Define a function that update cats into the database.
    Future<void> updateCat(Cat cat) async {
      final db = await database;

      await db.update(
        'cats',
        cat.toMap(),
        // Ensure that Cat has a matching note
        where: "id = ?",
        // PAss the Cat's note as a whereArg to prevent SQL injection
        whereArgs: [cat.id],
      );
    }

    // Define a function that delete cats into the database.
    Future<void> deleteCat(int id) async {
      final db = await database;

      await db.delete(
        'cats',
        where: "id = ?",
        whereArgs: [id],
      );
    }

    Future<List<Cat>> cats() async {
      final Database db = await database;

      // Query the table for all Cats
      final List<Map<String, dynamic>> maps = await db.query('cats');

      // Convert the List<Map<String, dynamic>> into a List<Cat>
      return List.generate(maps.length, (index) {
        return Cat(
          id: maps[index] ['id'],
          actHours: maps[index] ['act_hours'],
          totalHours: maps[index] ['total_hours'],
          dateTime: maps[index] ['date_time'],
          note: maps[index] ['note'],
        );
      }
      );
    }
}