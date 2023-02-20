import 'package:flutter/material.dart';

class ForTextFields extends StatelessWidget {
  final String hintname;
  final String labelname;
  final TextEditingController controllname;
  final String? validatetext;
  final int? length;
  final String? prefix;

  const ForTextFields(
      {super.key,
      required this.hintname,
      required this.labelname,
      required this.controllname,
      this.validatetext,
      this.length, this.prefix,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllname,
      decoration: InputDecoration(
          hintText: hintname,
          labelText: labelname,
          prefix:  Text(prefix!)),
      onTap: () {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatetext;
        } else {
          return null;
        }
      },
      maxLength: length,
    );
  }
}
