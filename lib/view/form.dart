import 'package:flutter/material.dart';
import 'form_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
      ),
      body: FormScreen(),
    );
  }
}
