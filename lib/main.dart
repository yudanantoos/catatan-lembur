import 'package:catatan_lembur/res/res.dart';
import 'package:catatan_lembur/res/route_me.dart';
import 'package:catatan_lembur/view/detail_page.dart';
import 'package:catatan_lembur/view/form.dart';
import 'package:catatan_lembur/view/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor color = new MaterialColor(0xff00a14f, Res.colorCodes);

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
      initialRoute: RouteMe.home,
      routes: {
        RouteMe.home: (context) => MyHomePage(
              title: 'Lemburan',
            ),
        RouteMe.detailPage: (context) => DetailPage(),
        RouteMe.form: (context) => App(),
      },
    );
  }
}
