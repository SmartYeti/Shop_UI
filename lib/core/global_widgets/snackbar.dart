import 'package:flutter/material.dart';

class SnackBarUtils {
  static void defualtSnackBar(String? message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final SnackBar snackBar =
        SnackBar(content: Center(child: Text(message ?? '')));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
