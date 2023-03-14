import 'package:flutter/material.dart';
import 'package:student_record/view/add_screen.dart';

class FloatingActionButtom extends StatelessWidget {
  const FloatingActionButtom({
    super.key,
  });

  static final List test = [];

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text("Add a Student"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddDetailsScreen(
                isUpdate: false,
                bannertitile: "Add Student Details",
                btnName: "Save",
              );
            },
          ),
        );
      },
    );
  }
}
