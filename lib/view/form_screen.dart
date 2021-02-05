import 'package:flutter/material.dart';
import 'package:catatan_lembur/control/form_logic.dart';


class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final _formKey = GlobalKey<FormState>();

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
            FormLogic.dateField(),
            FormLogic.startHourField(),
            FormLogic.finishHourField(),
            FormLogic.noteField(),
            Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: FormLogic.registerButton(),
            ),
          ],
        ),
      ),
    );
  }


}
