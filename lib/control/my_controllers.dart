import 'package:catatan_lembur/model/cat.dart';
import 'package:catatan_lembur/model/my_crud.dart';

class MyControllers {

  static MyCrud _myCrud;

  MyControllers() {
    _myCrud = MyCrud();
  }

  static Future<int> insert(Cat cat) async => await _myCrud.insertCat(cat);

  static Future<int> update(Cat cat) async => await _myCrud.updateCat(cat);

  static Future<int> delete(int id) async => await _myCrud.deleteCat(id);

  static Future<List<Cat>> showData()  async => await _myCrud.fetchCat();
}