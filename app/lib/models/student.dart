class Student {
  int id;
  String name;
  String courses;
  String level;

  Student({this.id, this.name, this.courses, this.level});

  factory Student.fromJson(dynamic json) {
    return Student(
      id: json['id'],
      name: json['name'],
      courses: json['courses'],
      level: json['level'],
    );
  }
//todo add more properties

 
}