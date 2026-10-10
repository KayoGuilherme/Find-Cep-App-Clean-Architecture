import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, Colors, ScaffoldMessenger, SnackBar;

enum SnackBarType { success, error }

extension SnackBarExtension on BuildContext {
  void showSnackBar(SnackBarType snackbarType, String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: switch (snackbarType) {
            SnackBarType.success => Colors.green,
            SnackBarType.error => Colors.red,
          },
        ),
      );
  }
}
