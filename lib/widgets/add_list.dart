import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record/controllers/db/db_functions.dart';
import 'package:student_record/view/add_screen.dart';
import 'package:student_record/view/details_screen.dart';

class Addlist extends StatelessWidget {
  const Addlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, datas, _) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text('${index +1}'),
              ),
              title: Text(datas.allData[index].name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddDetailsScreen(
                              isUpdate: true,
                              keys: index,
                              model: datas.allData[index],
                              bannertitile: "Edit Student Details",
                              btnName: "Update",
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (
                          BuildContext ctx,
                        ) {
                          return AlertDialog(
                            title: const Text(
                              "Delete",
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text(
                                    'Are You Sure you want to delete this record',
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  datas.deleteStudents(index);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Yes",
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                child: const Text(
                                  "No",
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(
                        name: datas.allData[index].name,
                        age: datas.allData[index].age,
                        address: datas.allData[index].age,
                        contactnumber: datas.allData[index].number!,
                      );
                    },
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
          itemCount: datas.allData.length,
        );
      },
    );
  }
}
