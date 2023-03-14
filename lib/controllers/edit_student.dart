import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record/controllers/db/db_functions.dart';
import 'package:student_record/model/db_model.dart';

class EditStudents {
  
  static Future<void> onAddStudentButtonClick({
    required String snack,
    required context,
    required TextEditingController stdentName,
    required TextEditingController stdentAge,
    required TextEditingController stdentAddress,
    required TextEditingController stdentNumber,
  }) async {
    final sName = stdentName.text.trim();
    final sAge = stdentAge.text.trim();
    final sAddress = stdentAddress.text.trim();
    final sNumber = stdentNumber.text.trim();

    if (sName.isEmpty || sAge.isEmpty || sAddress.isEmpty || sNumber.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          content: Text(snack),
        ),
      );
    }

    final studentvalue = StudentModel(
        name: sName, age: sAge, classes: sAddress, number: sNumber);
    Provider.of<DatabaseProvider>(context, listen: false)
        .addStudentsdetails(studentvalue);

    stdentName.clear();
    stdentAge.clear();
    stdentAddress.clear();
    stdentNumber.clear();
  }
}
