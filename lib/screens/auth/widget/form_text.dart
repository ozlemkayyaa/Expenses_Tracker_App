import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  const FormText({
    super.key,
    required this.onPressed,
    required this.message,
    required this.buttonName,
  });

  final VoidCallback onPressed;
  final String message;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        TextButton(onPressed: onPressed, child: Text(buttonName))
      ],
    );
  }
}
