import 'dart:html';

import 'package:catatan_lembur/model/cat.dart';
import 'package:catatan_lembur/model/database_helper.dart';
import 'package:flutter/material.dart';

class ListMe extends StatefulWidget {
  @override
  _ListMeState createState() => _ListMeState();
}

class _ListMeState extends State<ListMe> {
  List<Cat> _cats = [];
  DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    _refreshCatList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Text('Tanggal'),
                title: Text('Jam lembur'),
                subtitle: Text('Upah Lembur'),
                trailing: Icon(
                  Icons.arrow_forward_ios
                ),
              ),
            ],
          );
        },
        itemCount: _cats.length,
      ),
    );
  }

  void _refreshCatList() async{
    List<Cat> x = await _databaseHelper.fetchCat();
    setState(() {
      _cats = x;
    });
  }
}
