import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class snackBar {
  static void showSnackBar(
      BuildContext context, String message, String title, contentType, color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: contentType,
            messageFontSize: 16,
            color: color),
      ));
  }
}
