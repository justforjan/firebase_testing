import 'package:flutter/material.dart';

Widget addVerticalSpace(double space) {
  return SizedBox(
    height: space,
  );
}

// error message to user
void showErrorMessage(String message, BuildContext context) {
  Future.delayed(Duration.zero, () {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(message));
        });
  });
}
