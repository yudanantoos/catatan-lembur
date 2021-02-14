import 'package:catatan_lembur/control/my_logic.dart';
import 'package:catatan_lembur/model/cat.dart';

class DepnakerLogic extends MyLogic{

  Cat _cat;
  var _tanggal, _jamAsli, _hasilJamLembur, _hasilUpahLembur, _gapok, _note;

  DepnakerLogic();

  @override
  hariKerja(jam) {
    this._hasilJamLembur = jam < 2 ? jam * 1.5 : (jam - 1) * 2 + 1 * 1.5;
    this._hasilUpahLembur = this._hasilJamLembur * 1 / 173 * this._gapok;

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
    this._hasilUpahLembur = this._hasilJamLembur * 1 / 173 * this._gapok;
  }

}