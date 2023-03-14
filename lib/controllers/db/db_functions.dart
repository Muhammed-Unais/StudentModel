import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record/model/db_model.dart';

class DatabaseProvider with ChangeNotifier {
  final List<StudentModel> _allData = [];

  List<StudentModel> get allData => _allData;

  Future addStudentsdetails(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.add(value);
  }

  Future<void> deleteStudents(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(id);
  }

  Future<void> edit(int id, StudentModel model) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.putAt(id, model);
  }

  getAll() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    _allData.clear();
    _allData.addAll(studentDB.values);
    notifyListeners();
  }
}
