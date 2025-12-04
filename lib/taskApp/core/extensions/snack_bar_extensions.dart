import 'package:flutter/material.dart';

extension SnackBarExtensions on BuildContext {
  void snackBar({required String content, required Color backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        content: Text(
          content,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
