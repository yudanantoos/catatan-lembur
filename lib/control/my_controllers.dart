import 'package:catatan_lembur/model/cat.dart';
import 'package:catatan_lembur/model/my_crud.dart';

class MyControllers {

  static MyCrud _myCrud;

  MyControllers() {
    _myCrud = MyCrud();
  }

  static insert(Cat cat) => _myCrud.insertCat(cat);

  static update(Cat cat) => _myCrud.updateCat(cat);

  static delete(int id) => _myCrud.deleteCat(id);

  static showData() => _myCrud.fetchCat();
}