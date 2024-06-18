
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as path;
import 'package:student_management/student%20model/student_model.dart';
Future<String> getDatabasePath() async {
  final databasesPath = await databaseFactoryFfi.getDatabasesPath();
  final dbPath = path.join(databasesPath, 'students.db');
  return dbPath;
}
List<StudentModel> studentmodellist=[];

Future<void> initDbforlinux() async {
  sqfliteFfiInit();
  final dbPath = await getDatabasePath();
  var db = await databaseFactoryFfi.openDatabase(dbPath);

  await db.execute('''
  CREATE TABLE IF NOT EXISTS Student (
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
}

Future<void> addforlinux(StudentModel sd) async {
  final dbPath = await getDatabasePath();
  var db = await databaseFactoryFfi.openDatabase(dbPath);

  await db.insert('Student', sd.toMap());
}

Future<void> getforlinux() async {
  final dbPath = await getDatabasePath();
  var db = await databaseFactoryFfi.openDatabase(dbPath);

  var result = await db.query('Student');
  studentmodellist = result.map((row) => StudentModel(
    id: row['id'] as int,
    name: row['name'] as String,
    location: row['location'] as String,
    phonenumber: row['phonenumber']as String,
    gender: row['gender'] as String,
    standard: row['standard'] as String,
    dateTime: DateTime.parse(row['dateTime'] as String) ,
    image: row['image'] as String?
  )).toList();
  
}
Future<void> deleteforlinux(int id) async {
  final dbPath = await getDatabasePath();
  var db = await databaseFactoryFfi.openDatabase(dbPath);

  await db.delete(
    'Student',
    where: 'id = ?',
    whereArgs: [id],
  );
}
Future<void> updateforlinux(StudentModel sd) async {
  final dbPath = await getDatabasePath();
  var db = await databaseFactoryFfi.openDatabase(dbPath);

  await db.update(
    'Student',
    sd.toMap(),
    where: 'id = ?',
    whereArgs: [sd.id],
  );
}
