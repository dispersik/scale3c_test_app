import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final bool _isObscure;
  final String hintText;

  factory AppTextField.notObscure({
    required String hintText,
  }) =>
      AppTextField._(
        isObscure: false,
        hintText: hintText,
      );

  factory AppTextField.obscure({
    required String hintText,
  }) =>
      AppTextField._(
        isObscure: true,
        hintText: hintText,
      );

  const AppTextField._({
    required this.hintText,
    required bool isObscure,
  }) : _isObscure = isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColorTheme.accent,
      obscureText: _isObscure,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        filled: true,
        fillColor: AppColorTheme.backgroundSecondary,
      ),
    );
  }
}
