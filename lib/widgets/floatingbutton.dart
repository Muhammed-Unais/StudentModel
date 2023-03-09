import 'package:flutter/material.dart';
import 'package:student_record/screens/add_screen.dart';

class FloatingActionButtom extends StatelessWidget {
  const FloatingActionButtom({
    super.key,
  });

  static final List test = [];

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddDetailsScreen(
                isUpdate: false,
                bannertitile: "Add details",
                btnName: "Save",
              );
            },
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
