import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class VakinhaTextformfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;

  const VakinhaTextformfield({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChange,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        isDense: true,
        filled: true,
        errorStyle: const TextStyle(color: Colors.redAccent),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
