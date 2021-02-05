import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:catatan_lembur/res/my_colors.dart';

class FormLogic {

  final _ctrlDateTime = TextEditingController();
  final _ctrlStartHours = TextEditingController();
  final _ctrlFinishHours = TextEditingController();
  final _ctrlNote = TextEditingController();


  static dateField() {
    final format = DateFormat('dd/MM/yyyy');
    return  DateTimeField(
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

  static startHourField() {
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

  static finishHourField() {
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

  static noteField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Catatan',
        hintText: 'Catatan Pekerjaan',
      ),
    );
  }

  static registerButton() {
    return RaisedButton(
      color: Color(MyColors.button),
      onPressed: ()  {},
      child: Text('Tambah'),
    );
  }
}