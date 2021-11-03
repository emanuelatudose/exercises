import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool hasFieldError;
  final UnderlineInputBorder renderBorder;
  final bool obscureText;

  const TextFormFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hasFieldError,
    required this.renderBorder,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: hasFieldError ? Colors.red : Colors.black,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: hasFieldError ? Colors.red : Colors.black,
        ),
        hintStyle: TextStyle(
          color: hasFieldError ? Colors.red : Colors.black,
        ),
        enabledBorder: renderBorder,
        focusedBorder: renderBorder,
      ),
      obscureText: obscureText,
    );
  }
}
