import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.iconData,
    required this.inputType,
  });
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        label: Text(labelText, style: TextStyle(color: Colors.black)),
        hint: Text(hintText),
        prefixIcon: Icon(iconData),
      ),
    );
  }
}
