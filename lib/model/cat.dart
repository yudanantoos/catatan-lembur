class Cat {
  int id;
  double actHours, totalHours;
  String dateTime, note;

  static const tblCats = 'cats';
  static const colId = 'id';
  static const colActHours = 'act_hours';
  static const colTotalHours = 'total_hours';
  static const colDateTime = 'date_time';
  static const colNote = 'note';

  Cat({this.id, this.actHours, this.totalHours, this.dateTime, this.note});

  Cat.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    actHours = map[colActHours];
    totalHours = map[colTotalHours];
    dateTime = map[colDateTime];
    note = map[colNote];
  }

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colActHours: actHours,
      colTotalHours: totalHours,
      colDateTime: dateTime,
      colNote: note
    };
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}
