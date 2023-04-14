import 'package:flutter/material.dart';

class TextInputsField extends StatelessWidget {
  final controller;
  final keyboard;
  final icon;
  final validator;
  final String hintText;
  final bool obscureText;
  const TextInputsField({
    super.key,
    required this.icon,
    required this.keyboard,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
