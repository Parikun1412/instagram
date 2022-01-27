import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textFieldController;
  final bool isPass;
  final String hinttext;
  const TextFieldInput({Key? key, required this.textFieldController, this.isPass = false, required this.hinttext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white
      ),
      keyboardType: TextInputType.text,
      obscureText: isPass,
    );
  }
}

