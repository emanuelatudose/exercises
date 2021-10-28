import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? Function(String?) validator;
  final String labelText;

  const TextFormFieldWidget({
    Key? key,
    required this.validator,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
