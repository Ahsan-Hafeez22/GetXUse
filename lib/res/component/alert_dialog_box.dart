import 'package:flutter/material.dart';

class CustomAlertDialogBox extends StatelessWidget {
  final String title;
  final String des;
  final VoidCallback onPressOK;
  const CustomAlertDialogBox(
      {super.key,
      required this.title,
      required this.des,
      required this.onPressOK});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(des),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "cancel",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: onPressOK,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10),
            child: const Text(
              "ok",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
