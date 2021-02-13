import 'package:catatan_lembur/control/my_logic.dart';
import 'package:catatan_lembur/model/cat.dart';

class DepnakerLogic extends MyLogic{

  Cat _cat;
  var _tanggal, _jamAsli, _hasilJamLembur, _hasilUpahLembur, _gapok, _note;

  DepnakerLogic() {
    _cat = Cat(super);
  }

  @override
  hariKerja(jam) {
    _hasilJamLembur = jam < 2 ? jam * 1.5 : (jam - 1) * 2 + 1 * 1.5;
    _hasilUpahLembur = _hasilJamLembur * 1 / 173 * _gapok;

  }

  @override
  hariLibur(jam) {
    if(jam <= 8) {
      _hasilJamLembur = jam * 2;
    }
    else if(jam > 8 && jam <= 9) {
      _hasilJamLembur = (jam - 8) * 3 + 8 * 2;
    }
    else {
      _hasilJamLembur = (jam - 9) * 4 + 8 * 2 + 1 * 3;
    }
    _hasilUpahLembur = _hasilJamLembur * 1 / 173 * _gapok;
  }

}