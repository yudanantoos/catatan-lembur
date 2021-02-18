import 'package:catatan_lembur/model/preferences.dart';
import 'package:catatan_lembur/res/my_colors.dart';
import 'package:flutter/material.dart';

class GapokDialog{

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _gajiPokok = TextEditingController();

  formGapok(BuildContext context) async {
    await showDialog(
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

  _saveGapok() async{
    var _pref = Preferences();
      await _pref.setIsiGapok(_gajiPokok.text);
      await _pref.setCekGapok(true);
  }
}