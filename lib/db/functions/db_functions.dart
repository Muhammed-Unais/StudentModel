import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_record/model/db_model.dart';

class DatabaseProvider with ChangeNotifier {
  List<StudentModel> allData = [];

  Future addStudentsdetails(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.add(value);
    notifyListeners();
  }

  Future<void> deleteStudents(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(id);
    notifyListeners();
  }

  Future<void> edit(int id, StudentModel model) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.putAt(id, model);
    notifyListeners();
  }

  getAll() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    allData.clear();
    allData.addAll(studentDB.values);
    notifyListeners();
  }
}
