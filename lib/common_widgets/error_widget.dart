import 'package:flutter/material.dart';




class ErrorUi extends StatelessWidget {
  final String message;
  const ErrorUi({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message, style: TextStyle(fontSize: 20, color: Colors.pink),)
      ],
    );
  }
}
