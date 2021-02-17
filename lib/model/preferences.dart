import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  final String _gapok = 'gapok';
  final String _cekGapok = 'cekGapok';
  SharedPreferences _sharedPreferences;

  Preferences();

  void setIsiGapok(double value) async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setDouble(_gapok, value);
  }

  void setCekGapok(bool bool) async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool(_cekGapok, bool);
  }

  getIsiGapok() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getString(_gapok);
  }

  getCekGapok() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getBool(_cekGapok);
  }
}