import 'package:flutter/material.dart';
import 'package:student_record/controllers/add_student.dart';
import 'package:student_record/controllers/edit_student.dart';
import 'package:student_record/model/db_model.dart';
import 'package:student_record/widgets/text_fields.dart';

class AddDetailsScreen extends StatelessWidget {
  AddDetailsScreen({
    super.key,
    required this.bannertitile,
    required this.btnName,
    this.model,
    required this.isUpdate,
    this.keys,
  });

  final String bannertitile;
  final String btnName;
  final StudentModel? model;
  final bool isUpdate;
  final int? keys;

  final _studentName = TextEditingController();
  final _studentAge = TextEditingController();
  final _studentClass = TextEditingController();
  final _studentNumber = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (isUpdate) {
      _studentName.text = model!.name;
      _studentAge.text = model!.age;
      _studentClass.text = model!.classes!;
      _studentNumber.text = model!.number!;
    }
    return Scaffold(
      body: SafeArea(
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
                isNumber: false,
                hintname: "Full Name",
                labelname: "Name",
                controllname: _studentName,
                validatetext: "Please Enter Your Full Name",
                prefix: "",
              ),
              ForTextFields(
                isNumber: true,
                hintname: "",
                labelname: "Age",
                controllname: _studentAge,
                validatetext: "Please Enter Your Age",
                prefix: "",
              ),
              ForTextFields(
                isNumber: false,
                hintname: "",
                labelname: "Address",
                controllname: _studentClass,
                validatetext: "Please Enter Your Address",
                prefix: "",
              ),
              ForTextFields(
                isNumber: true,
                hintname: "",
                labelname: "Contact Number",
                controllname: _studentNumber,
                validatetext: "Please Enter Valid Number",
                prefix: "+91",
                isPhone: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate() && isUpdate != true) {
                      EditStudents.onAddStudentButtonClick(
                          snack: "Successfully Added",
                          context: context,
                          stdentName: _studentName,
                          stdentAge: _studentAge,
                          stdentAddress: _studentClass,
                          stdentNumber: _studentNumber);
                      Navigator.pop(context);
                    } else if(_formkey.currentState!.validate() && isUpdate != false) {
                      Addstudent.onEdit(
                          snack: "Updated Success",
                          context: context,
                          stdentName: _studentName,
                          stdentAge: _studentAge,
                          stdentAddress: _studentClass,
                          stdentNumber: _studentNumber,
                          keys: keys);
                    }
                  },
                  child: Text(btnName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
