class Cat {
  final int _id;
  final double _actHours, _totalHours;
  final String _dateTime, _note;

  Cat(this._id, this._actHours, this._totalHours, this._dateTime, this._note);

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id' : _id,
      'act_hours' : _actHours,
      'total_hours' : _totalHours,
      'date_time' : _dateTime,
      'note' : _note,
    };
  }

  get id => _id;
  get actHours => _actHours;
  get totalHours => _totalHours;
  get dateTime => _dateTime;
  get note => _note;
}