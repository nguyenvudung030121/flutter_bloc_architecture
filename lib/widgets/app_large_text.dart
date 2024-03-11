import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final TextAlign alignment;

  const AppLargeText(
      {super.key,
      this.size = 30,
      required this.text,
      this.color = Colors.black,
      this.alignment = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
      textAlign: alignment,
    );
  }
}
