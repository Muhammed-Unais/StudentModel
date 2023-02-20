import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record/model/db_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future addStudentsdetails(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudents(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(id);
  await getAllStudents();
}

