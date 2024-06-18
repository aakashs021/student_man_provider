class StudentModel {
  int id;
  String name;
  String location;
  String phonenumber;
  String gender;
  String standard;
  DateTime dateTime;
  String? image;

  StudentModel({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
    required this.phonenumber,
    required this.gender,
    required this.standard,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'phonenumber': phonenumber,
      'gender': gender,
      'standard': standard,
      'dateTime': dateTime.toIso8601String(),
      'image': image
    };
  }
}
