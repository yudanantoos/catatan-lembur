import 'package:catatan_lembur/res/my_colors.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';


class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final _formKey = GlobalKey<FormState>();
  final _ctrlDateTime = TextEditingController();
  final _ctrlStartHours = TextEditingController();
  final _ctrlFinishHours = TextEditingController();
  final _ctrlNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0), // SET MARGIN DARI CONTAINER
      child: Form(
        key: _formKey,
        child: Column(
          // CHILDREN DARI COLUMN BERISI 4 BUAH OBJECT YANG AKAN DIRENDER,
          // YAKNI TextInput UNTUK NAME, EMAIL, PASSWORD DAN TOMBOL DAFTAR
          children: [
            dateField(),
            hourField(),
            noteField(),
            Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: registerButton(),
            ),
          ],
        ),
      ),
    );
  }

  dateField() {
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

  hourField() {
    double _nominal;

    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Jam',
        hintText: 'Jam Lembur',
      ),
      onTap: (){
        showDialog<double>(context: context,
            builder: (BuildContext context){
              return NumberPickerDialog.decimal(minValue: 1, maxValue: 12, initialDoubleValue: 1.0);
            }).then((value) => setState(() => _nominal = value));
      },
      onSaved: (String value){
        Text(_nominal.toString());
      },
    );
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
      onPressed: ()  {},
      child: Text('Tambah'),
    );
  }
}
