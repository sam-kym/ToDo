import 'package:flutter/material.dart';

import 'custom_button.dart';

class ToDoDialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   ToDoDialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 200,
        width: 450,
        decoration: const BoxDecoration(
          color: Colors.lightGreenAccent
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Add a new Task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: "Save", onPressed: onSave),
                CustomButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ) ,
      ),
    );
  }
}
