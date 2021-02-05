import 'package:catatan_lembur/control/my_controllers.dart';
import 'package:catatan_lembur/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:catatan_lembur/res/my_colors.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  List<Cat> _cats = [];
  Cat _cat = Cat(actHours: 2, totalHours: 3.5, dateTime: '04/10/1990', note: 'tes ae');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0), // SET MARGIN DARI CONTAINER
      child: Form(
        child: Column(
          // CHILDREN DARI COLUMN BERISI 4 BUAH OBJECT YANG AKAN DIRENDER,
          // YAKNI TextInput UNTUK NAME, EMAIL, PASSWORD DAN TOMBOL DAFTAR
          children: [
            dateField(),
            startHourField(),
            finishHourField(),
            noteField(),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: registerButton(),
            ),
          ],
        ),
      ),
    );
  }

  dateField() {
    final format = DateFormat('dd/MM/yyyy');
    return DateTimeField(
        decoration: InputDecoration(
          labelText: 'Tanggal',
          hintText: 'Tanggal Lembur',
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              initialDate: currentValue ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
        });
  }

  startHourField() {
    final format = DateFormat('HH:mm');
    return DateTimeField(
        decoration: InputDecoration(
          labelText: 'Start',
          hintText: 'Dari Jam',
        ),
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()));
          return DateTimeField.convert(time);
        });
  }

  finishHourField() {
    final format = DateFormat('HH:mm');
    return DateTimeField(
        decoration: InputDecoration(
          labelText: 'Finish',
          hintText: 'Sampai Jam',
        ),
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()));
          return DateTimeField.convert(time);
        });
  }

  noteField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Catatan',
        hintText: 'Catatan Pekerjaan',
      ),
    );
  }

  registerButton() {
    return RaisedButton(
      color: Color(MyColors.button),
      onPressed: () async {_cats = await MyControllers.showData();await MyControllers.insert(_cat);print(_cats[0].note);},
      child: Text('Tambah'),
    );
  }
}
