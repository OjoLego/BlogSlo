import 'package:flutter/material.dart';

class DTextInputField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final bool showVisibilityIcon;
  final bool obscureText;

  const DTextInputField({
    super.key,
    required this.keyboardType,
    required this.controller,
    this.validator,
    required this.hintText,
    this.showVisibilityIcon = false,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(
          color: Color(0xFF9CA3AF),
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.all(10.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Color(0xFF9CA3AF)),
        ),
        suffixIcon: showVisibilityIcon
            ? IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  // Handle visibility toggle
                },
              )
            : null,
      ),
    );
  }
}
