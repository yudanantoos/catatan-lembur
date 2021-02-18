import 'package:catatan_lembur/model/preferences.dart';
import 'package:catatan_lembur/res/my_colors.dart';
import 'package:catatan_lembur/view/gapok_dialog.dart';
import 'package:flutter/material.dart';

class FormGapok extends StatefulWidget with GapokDialog{
  @override
  _FormGapokState createState() => _FormGapokState();
}

class _FormGapokState extends State<FormGapok> with GapokDialog{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: formGapok(context),
    );
  }
}
