import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final bool isObscure;
  final String hintText;
  final TextEditingController controller;

  const AppTextField({
    required this.hintText,
    required this.controller,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColorTheme.accent,
      obscureText: isObscure,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        filled: true,
        fillColor: AppColorTheme.backgroundSecondary,
      ),
    );
  }
}
