import 'package:flutter/material.dart';
import 'package:student_record/screens/searchfile.dart';
import '../db/functions/db_functions.dart';
import 'add_list.dart';
import 'bottomsheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Record"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchWidgets());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Column(children: [
        Expanded(child: Addlist()),
      ]),
      floatingActionButton: BottomAddsheet(),
    );
  }
}
