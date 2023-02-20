import 'package:flutter/material.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/model/db_model.dart';
import 'package:student_record/screens/bottomsheet.dart';
import 'package:student_record/screens/details_screen.dart';

class Addlist extends StatelessWidget {
  Addlist({super.key});

  final myTest = BottomAddsheet();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext context, List<StudentModel> newstdadd, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = newstdadd[index];
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
              ),
              title: Text(data.name),
              // subtitle: Text(data.age),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        // BottomAddsheet()
                        myTest.editUser(newstdadd[index], context, index);
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: const Text("Delete"),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text('Are You Sure you want to delete this record'),
                                 
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  deleteStudents(index);
                                   Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(
                          name: data.name,
                          age: data.age,
                          address: data.classes!,
                          contactnumber: data.number!);
                    },
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
          itemCount: newstdadd.length,
        );
      },
    );
  }
}
