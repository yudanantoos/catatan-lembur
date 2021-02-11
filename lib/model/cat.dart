import 'package:catatan_lembur/control/my_logic.dart';

class Cat {
  int _id;
  double _actHours, _totalHours, _overtimePay;
  String _dateTime, _note;

  static const tblCats = 'cats';
  static const colId = '_id';
  static const colActHours = 'act_hours';
  static const colTotalHours = 'total_hours';
  static const colOvertimePay = 'overtime_pay';
  static const colDateTime = 'date_time';
  static const colNote = 'note';

  Cat.instance();

  Cat(this._id, this._actHours, this._totalHours, this._overtimePay, this._dateTime, this._note);

  Cat.fromMap(Map<String, dynamic> map) {
    _id = map[colId];
    _actHours = map[colActHours];
    _totalHours = map[colTotalHours];
    _overtimePay = map[colOvertimePay];
    _dateTime = map[colDateTime];
    _note = map[colNote];
  }

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colActHours: _actHours,
      colTotalHours: _totalHours,
      colOvertimePay: _overtimePay,
      colDateTime: _dateTime,
      colNote: _note
    };
    if (_id != null) {
      map[colId] = _id;
    }
    return map;
  }

  get note => _note;

  set note(value) {
    _note = value;
  }

  get dateTime => _dateTime;

  set dateTime(value) {
    _dateTime = value;
  }

  get overtimePay => _overtimePay;

  set overtimePay(value) {
    _overtimePay = value;
  }

  get totalHours => _totalHours;

  set totalHours(value) {
    _totalHours = value;
  }

  get actHours => _actHours;

  set actHours(value) {
    _actHours = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}
