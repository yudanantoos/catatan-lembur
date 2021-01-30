class Cat {
  final int id;
  final double actHours, totalHours;
  final String dateTime, note;

  Cat({this.id, this.actHours, this.totalHours, this.dateTime, this.note});

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'act_hours' : actHours,
      'total_hours' : totalHours,
      'date_time' : dateTime,
      'note' : note,
    };
  }
}