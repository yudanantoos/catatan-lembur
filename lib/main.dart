import 'package:catatan_lembur/database/cat.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  WidgetsFlutterBinding.ensureInitialized();

  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'cat_database.db'),
    // When the database is first created, create a table to store cats.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE cats(id INTEGER PRIMARY KEY, date_time DATETIME, note STRING"
      );
    },
    // Set the version. This execute the onCreate function and provides
    // path to perform database upgrades and downgrades.
    version: 1,
  );

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


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorCodes = {
      50: Color.fromRGBO(0, 161, 79, .1),
      100: Color.fromRGBO(0, 161, 79, .2),
      200: Color.fromRGBO(0, 161, 79, .3),
      300: Color.fromRGBO(0, 161, 79, .4),
      400: Color.fromRGBO(0, 161, 79, .5),
      500: Color.fromRGBO(0, 161, 79, .6),
      600: Color.fromRGBO(0, 161, 79, .7),
      700: Color.fromRGBO(0, 161, 79, .8),
      800: Color.fromRGBO(0, 161, 79, .9),
      900: Color.fromRGBO(0, 161, 79, 1),
    };

    MaterialColor color = new MaterialColor(0xff00a14f, colorCodes);

    return MaterialApp(
      title: 'Catatan Lembur',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: color,
      ),
      home: MyHomePage(title: 'Lemburan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Tambah',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
