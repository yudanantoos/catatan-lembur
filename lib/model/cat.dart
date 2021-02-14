
class Cat {
  var _id, _actHours, _totalHours, _overtimePay, _dateTime, _note;

  static const tblCats = 'cats';
  static const colId = '_id';
  static const colActHours = 'act_hours';
  static const colTotalHours = 'total_hours';
  static const colOvertimePay = 'overtime_pay';
  static const colDateTime = 'date_time';
  static const colNote = 'note';

  Cat();

  Cat.fromMap(Map<String, dynamic> map) {
    this._id = map[colId];
    this._actHours = map[colActHours];
    this._totalHours = map[colTotalHours];
    this._overtimePay = map[colOvertimePay];
    this._dateTime = map[colDateTime];
    this._note = map[colNote];
  }

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colActHours: this._actHours,
      colTotalHours: this._totalHours,
      colOvertimePay: this._overtimePay,
      colDateTime: this._dateTime,
      colNote: this._note
    };
    if (this._id != null) {
      map[colId] = this._id;
    }
    return map;
  }

  get note => _note;

  set note(value) {
    this._note = value;
  }

  get dateTime => _dateTime;

  set dateTime(value) {
    this._dateTime = value;
  }

  get overtimePay => _overtimePay;

  set overtimePay(value) {
    this._overtimePay = value;
  }

  get totalHours => _totalHours;

  set totalHours(value) {
    this._totalHours = value;
  }

  get actHours => _actHours;

  set actHours(value) {
    this._actHours = value;
  }

  get id => _id;

  set id(value) {
    this._id = value;
  }
}
