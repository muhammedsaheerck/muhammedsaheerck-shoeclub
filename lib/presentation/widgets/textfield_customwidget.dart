import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final int? maxLine;
  final TextInputType keybordtype;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFieldWidget(
      {Key? key,
      required this.keybordtype,
      required this.hint,
      required this.controller,
      required this.validator,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      cursorColor: Colors.deepPurple,
      decoration: InputDecoration(
        focusColor: Colors.deepPurple,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.deepPurple)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: hint,
      ),
      keyboardType: keybordtype,
      maxLength: maxLine,
       
    );
  }
}
