import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record/db/functions/db_functions.dart';
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
    if(isUpdate){
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
                validatetext: "Please Enter Your Age",
                length: 2,
                prefix: "",
              ),
              ForTextFields(
                hintname: "",
                labelname: "Address",
                controllname: _studentClass,
                validatetext: "Please Enter Your Address",
                prefix: "",
              ),
              ForTextFields(
                hintname: "",
                labelname: "Contact Number",
                controllname: _studentNumber,
                validatetext: "Please Enter Your Contact Number",
                length: 10,
                prefix: "+91",
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate() && isUpdate != true) {
                      onAddStudentButtonClick(context, "Added Succesfully");
                      Navigator.pop(context);
                    } else {
                      onEdit("Update Successfully",context);
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

  Future<void> onEdit(String snack, context) async {
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
    Provider.of<DatabaseProvider>(context,listen: false).edit(keys!, studentvalue);
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
    Provider.of<DatabaseProvider>(context,listen: false).addStudentsdetails(studentvalue);

    _studentName.clear();
    _studentAge.clear();
    _studentClass.clear();
    _studentNumber.clear();
  }
}
