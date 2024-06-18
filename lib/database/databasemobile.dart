import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:student_management/database/databasedesktop.dart';
import 'package:student_management/student%20model/student_model.dart';

Database? dbformobile;
initDbformobile() async {
  dbformobile = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
  CREATE TABLE Student (
    id INTEGER PRIMARY KEY,
    name TEXT,
    location TEXT,
    phonenumber TEXT,
    gender TEXT,
    standard TEXT,
    dateTime TEXT,
    image TEXT
  )
  ''');
    },
  );
}

getformobile() async {
  var result = await dbformobile!.query('Student');
  studentmodellist = result
      .map((row) => StudentModel(
          id: row['id'] as int,
          name: row['name'] as String,
          location: row['location'] as String,
          phonenumber: row['phonenumber'] as String,
          gender: row['gender'] as String,
          standard: row['standard'] as String,
          dateTime: DateTime.parse(row['dateTime'] as String),
          image: row['image'] as String?))
      .toList();
}

addformobile(StudentModel sd) async {
  await dbformobile!.insert('Student', sd.toMap());
}

deleteformobile(int id) async {
  await dbformobile!.delete(
    'Student',
    where: 'id = ?',
    whereArgs: [id],
  );
}

updateformobile(StudentModel sd) async {
  await dbformobile!
      .update('Student', sd.toMap(), where: 'id = ?', whereArgs: [sd.id]);

}
