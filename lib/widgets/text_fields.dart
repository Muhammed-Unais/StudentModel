import 'package:flutter/material.dart';

class ForTextFields extends StatelessWidget {
  final String hintname;
  final String labelname;
  final TextEditingController controllname;
  final String? validatetext;
  final int? length;
  final String? prefix;
  final bool isNumber;
  final bool isPhone;

  const ForTextFields({
    this.isPhone = false,
    super.key,
    required this.hintname,
    required this.labelname,
    required this.controllname,
    this.validatetext,
    this.length,
    this.prefix,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      controller: controllname,
      decoration: InputDecoration(
        hintText: hintname,
        labelText: labelname,
        prefix: Text(prefix!),
      ),
      onTap: () {},
      validator: (value) {
        if (value == null || value.isEmpty || isPhone && value.length != 10) {
          return validatetext;
        } else {
          return null;
        }
      },
      maxLength: length,
    );
  }
}
