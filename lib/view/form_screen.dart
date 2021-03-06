
import 'package:catatan_lembur/control/depnaker_logic.dart';
import 'package:catatan_lembur/control/my_controllers.dart';
import 'package:catatan_lembur/model/cat.dart';
import 'package:catatan_lembur/model/preferences.dart';
import 'package:catatan_lembur/res/my_colors.dart';
import 'package:catatan_lembur/view/gapok_dialog.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with GapokDialog{
  final _formKey = GlobalKey<FormState>();
  final _cat = Cat();
  TextEditingController _ctrlDateTime, _ctrlOvertimeHours, _ctrlNote;
  final format = DateFormat('EEEE, d MMMM yyyy', 'id_ID');

  @override
  void initState() {
    super.initState();
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
              initialDate: currentValue ?? format.format(DateTime.now()),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
        },
      validator: (val) => (val.toString().length == 0 ? 'Tanggal belum diisi' : null),
    onSaved: (val) => setState(() => _cat.dateTime = _ctrlDateTime.text),);
  }

  hourField() {
    return TextFormField(
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
                title: Text(('Pilih Jam Lembur'), style: TextStyle(fontSize: 12, letterSpacing: 1)),
                decoration: BoxDecoration(

                ),
                minValue: 1,
                maxValue: 12,
                initialIntegerValue: 1,
              );
            }).then((value) {
          if (value != null) {
            setState(() {
              _ctrlOvertimeHours.value = TextEditingValue(text: '$value');
            });
          }
        });
      },
      validator: (val) => (val.length == 0 ? 'Jam belum diisi' : null),
      onSaved: (val) => setState(() => _cat.actHours = val.toString()),
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
      validator: (val) => (val.length == 0 ? 'Catatan pekerjaan belum diisi' : null),
      onSaved: (val) => setState(() => _cat.note = val),
    );
  }

  registerButton() {
    var form = _formKey.currentState;
    var _gapok = Preferences();
    return RaisedButton(
      color: Color(MyColors.primary),
      onPressed: () async{
        if(form.validate()) {
          form.save();
          final _depnakerLogic = DepnakerLogic(_cat);
            await _gapok.setIsiGapok(4200000);
            await _gapok.setCekGapok(true);
            _depnakerLogic.hariKerja(int.parse(_ctrlOvertimeHours.text));
            await MyControllers.insert(_cat);
            print(_cat.toString());
            Navigator.pop(context);
        }
      },
      child: Text('Tambah'),
    );
  }
}
