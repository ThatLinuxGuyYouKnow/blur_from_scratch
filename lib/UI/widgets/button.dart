import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  const Button({super.key, required this.buttonText, required this.onPressed});
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed(),
        child: Container(
          child: Center(
            child: Text(buttonText),
          ),
          width: 250,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ));
  }
}
