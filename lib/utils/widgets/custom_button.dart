import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  CustomButton({super.key, 
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),);
  }
}
