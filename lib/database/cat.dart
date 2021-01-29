class Cat {
  final int id;
  final double _actHours, _totalHours;
  final String _dateTime, _note;

  Cat(this.id, this._actHours, this._totalHours, this._dateTime, this._note);

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'act_hours' : _actHours,
      'total_hours' : _totalHours,
      'date_time' : _dateTime,
      'note' : _note,
    };
  }
}