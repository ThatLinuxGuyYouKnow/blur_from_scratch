import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    ));
  }
}
