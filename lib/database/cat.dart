class Cat {
  final int id;
  final DateTime dateTime;
  final String note;

  Cat(this.id, this.dateTime, this.note);

  // Convert a Cat into a map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'date_time' : dateTime,
      'note' : note,
    };
  }
}