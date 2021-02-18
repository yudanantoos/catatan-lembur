import 'package:flutter/material.dart';
import 'package:path/path.dart';

class GapokDialog{

  final _formKey = GlobalKey<FormState>();
  TextEditingController _gajiPokok = TextEditingController();

  _formGapok(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Gaji Pokok'),
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextField(
                        controller: _gajiPokok,
                        decoration: InputDecoration(
                          labelText: 'Gapok',
                          hintText: 'Rp. 5000,000.00',
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.money),
                        ),
                      ),
                      RaisedButton(
                          child: Text('Simpan'),
                          color: Color(MyColors.primary),
                          onPressed: _saveGapok()
                      ),
                    ],
                  )),
            ],
          );
        });
  }

  _saveGapok() {
    var _pref = Preferences();
    setState(() async{
      await _pref.setIsiGapok(_gajiPokok.text);
      await _pref.setCekGapok(true);
    });
  }
}