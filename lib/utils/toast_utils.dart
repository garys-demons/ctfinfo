import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast({
    required String message,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static void showSuccessToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.green,
    );
  }

  static void showErrorToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.red,
    );
  }

  static void showInfoToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.blue,
    );
  }
}
