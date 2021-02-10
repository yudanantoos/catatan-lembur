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
  GlobalKey _formKey;
  TextEditingController _ctrlDateTime, _ctrlOvertimeHours, _ctrlNote;
  var _nominal = '2';
  final format = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _ctrlDateTime = TextEditingController(text: format.format(DateTime.now()));
    _ctrlOvertimeHours = TextEditingController(text: _nominal);
    _ctrlNote = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                margin: EdgeInsets.only(top: 30),
                child: registerButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dateField() {
    return DateTimeField(
        controller: _ctrlDateTime,
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
    return TextFormField(
      keyboardType: TextInputType.number,
      readOnly: true,
      controller: _ctrlOvertimeHours,
      decoration: InputDecoration(
        labelText: 'Jam',
        hintText: 'Jam Lembur',
      ),
      onTap: () {
        showDialog<int>(
            context: context,
            builder: (BuildContext context) {
              return NumberPickerDialog.integer(
                title: Text(('Jam Lembur')),
                minValue: 1,
                maxValue: 12,
                initialIntegerValue: 1,
              );
            }).then((value) => setState(() => _nominal = value.toString()));
      },
    );
  }

  noteField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: _ctrlNote,
      decoration: InputDecoration(
        labelText: 'Catatan',
        hintText: 'Catatan Pekerjaan',
      ),
      maxLines: null,
    );
  }

  registerButton() {
    return RaisedButton(
      color: Color(MyColors.button),
      onPressed: () {},
      child: Text('Tambah'),
    );
  }
}
