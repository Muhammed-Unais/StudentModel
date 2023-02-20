import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String contactnumber;
  const DetailsScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.contactnumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students Details"),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 350,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.grey)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Student Name:$name",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Student Age:$age",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Address:$address",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Contact NUmber:$contactnumber",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
