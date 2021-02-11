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
  final format = DateFormat('dd/MM/yyyy');
  double _nominalHours;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _ctrlDateTime = TextEditingController(text: format.format(DateTime.now()));
    _ctrlOvertimeHours = TextEditingController();
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
              Wrap(
                runSpacing: 10,
                children: [
                  dateField(),
                  hourField(),
                  noteField(),
                  Center(
                    child: registerButton(),
                  ),
                ],
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
          border: OutlineInputBorder(),
          icon: Icon(Icons.calendar_today),
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
        border: OutlineInputBorder(),
        icon: Icon(Icons.access_time),
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
            }).then((value) {
          if (value != null) {
            setState(() {
              _ctrlOvertimeHours.value = TextEditingValue(text: '$value Jam');
            });
          }
        });
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
        border: OutlineInputBorder(),
        icon: Icon(Icons.sticky_note_2_outlined),
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
