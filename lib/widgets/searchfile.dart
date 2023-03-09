import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_record/db/functions/db_functions.dart';
import 'package:student_record/screens/details_screen.dart';

class SearchWidgets extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (BuildContext context, databaseProvider, Widget? child) {
        return ListView.builder(
          itemCount: databaseProvider.allData.length,
          itemBuilder: (ctx, index) {
            final value=databaseProvider.allData[index];
            if (value.name.toLowerCase().contains(
                  query.toLowerCase(),
                )) {
              return Column(
                children: [
                  ListTile(
                    title: Text(value.name),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (BuildContext context, databaseProvider,
          Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = databaseProvider.allData[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return ListTile(
                title: Text(data.name),
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
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                ),
              );
            } else {
              return Container();
            }
          },
          itemCount: databaseProvider.allData.length,
        );
      },
    );
  }
}
