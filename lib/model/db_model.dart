
import 'package:hive_flutter/adapters.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String? classes;

  @HiveField(3)
  final String? number;

  StudentModel(
      {required this.name,
      required this.age,
      required this.classes,
      required this.number});
}
