import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/model/db_model.dart';
import 'package:student_record/screens/text_fields.dart';

class BottomAddsheet extends StatelessWidget {
  BottomAddsheet({
    super.key,
  });

  final _studentName = TextEditingController();
  final _studentAge = TextEditingController();
  final _studentClass = TextEditingController();
  final _studentNumber = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        modelBottomsheet(
            context, "Submit", "Add Student Details", "Successfully Added");
      },
      child: const Icon(Icons.add),
    );
  }

  modelBottomsheet(
      BuildContext context, String btn, String bannertitile, String snackbar) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      elevation: 5,
      builder: (context) => SizedBox(
        height: 680,
        child: Form(
          key: _formkey,
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  bannertitile,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ForTextFields(
                hintname: "Full Name",
                labelname: "Name",
                controllname: _studentName,
                validatetext: "Please Enter Your Full Name",
                prefix: "",
              ),
              ForTextFields(
                hintname: "",
                labelname: "Age",
                controllname: _studentAge,
                validatetext: "Age Required",
                length: 2,
                prefix: "",
              ),
              ForTextFields(
                hintname: "",
                labelname: "Address",
                controllname: _studentClass,
                validatetext: "Address required",
                prefix: "",
              ),
              ForTextFields(
                hintname: "",
                labelname: "Contact Number",
                controllname: _studentNumber,
                validatetext: "Contact Number Required",
                length: 10,
                prefix: "+91",
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      onAddStudentButtonClick(context, snackbar);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(btn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClick(context, String snack) async {
    final sname = _studentName.text.trim();
    final sage = _studentAge.text.trim();
    final sClass = _studentClass.text.trim();
    final sNumber = _studentNumber.text.trim();

    if (sname.isEmpty || sage.isEmpty || sClass.isEmpty || sNumber.isEmpty) {
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

    final studentvalue =
        StudentModel(name: sname, age: sage, classes: sClass, number: sNumber);
    addStudentsdetails(studentvalue);

    _studentName.clear();
    _studentAge.clear();
    _studentClass.clear();
    _studentNumber.clear();
  }

  editUser(StudentModel studentModel, context, int id) async {
    modelBottomsheet(context, "Save", "Update Student Details",
        "Update Successfully");
    _studentName.text = studentModel.name;
    _studentAge.text = studentModel.age;
    _studentClass.text = studentModel.classes!;
    _studentNumber.text = studentModel.number!;

      deleteStudents(id);
    
  }
}
