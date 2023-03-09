import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record/widgets/searchfile.dart';
import '../db/functions/db_functions.dart';
import '../widgets/add_list.dart';
import '../widgets/floatingbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DatabaseProvider>(context).getAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Record"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchWidgets(),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Addlist(),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButtom(),
    );
  }
}
