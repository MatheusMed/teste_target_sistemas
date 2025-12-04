import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFormCustom({
    super.key,
    this.onChanged,
    required this.labelText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final int effectiveMaxLines = obscureText ? 1 : 90;
    final TextInputType effectiveKeyboardType = obscureText
        ? TextInputType.text
        : TextInputType.multiline;

    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      maxLines: effectiveMaxLines,
      minLines: 1,
      validator: validator,
      keyboardType: effectiveKeyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
