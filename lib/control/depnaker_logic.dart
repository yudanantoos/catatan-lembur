import 'package:catatan_lembur/control/my_logic.dart';
import 'package:catatan_lembur/model/cat.dart';
import 'package:catatan_lembur/model/preferences.dart';

class DepnakerLogic extends MyLogic{

  Cat _cat = Cat();
  var _hasilJamLembur, _hasilUpahLembur;
  final _gapok = Preferences();

  DepnakerLogic(this._cat);

  @override
  hariKerja(jam) async {
    this._hasilJamLembur = jam < 2 ? jam * 1.5 : (jam - 1) * 2 + 1 * 1.5;
    this._hasilUpahLembur = this._hasilJamLembur * 1 / 173 * await _gapok.getIsiGapok();
    _cat.totalHours = this._hasilJamLembur;
    _cat.overtimePay = this._hasilUpahLembur;
  }

  @override
  hariLibur(jam) {
    if(jam <= 8) {
      this._hasilJamLembur = jam * 2;
    }
    else if(jam > 8 && jam <= 9) {
      this._hasilJamLembur = (jam - 8) * 3 + 8 * 2;
    }
    else {
      this._hasilJamLembur = (jam - 9) * 4 + 8 * 2 + 1 * 3;
    }
    this._hasilUpahLembur = this._hasilJamLembur * 1 / 173 * _gapok.getIsiGapok();
    _cat.totalHours(this._hasilJamLembur);
    _cat.overtimePay(this._hasilUpahLembur);
  }

}