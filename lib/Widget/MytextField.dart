import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  IconData icon;
  TextEditingController controller;
  bool obscureText;
  AutovalidateMode autovalidateMode;

  MyTextField({Key? key,required this.hintText,required this.icon,required this.controller,required this.obscureText,required this.autovalidateMode,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      controller: controller,
      style: const TextStyle(
        color: Colors.grey
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
