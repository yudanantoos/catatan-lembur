import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  final String _gapok = 'gapok';
  final String _cekGapok = 'cekGapok';
  SharedPreferences _sharedPreferences;

  Preferences();

  setIsiGapok(value) async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setInt(_gapok, value);
  }

  setCekGapok(bool bool) async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setBool(_cekGapok, bool);
  }

  getIsiGapok() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getInt(_gapok);
  }

  getCekGapok() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getBool(_cekGapok);
  }
}