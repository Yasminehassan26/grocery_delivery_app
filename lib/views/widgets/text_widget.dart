import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  // final String email;
  final String title;
  final double font;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  TextWidget(
      {required this.title,
      this.font = 14,
      this.color = Colors.black,
      this.weight = FontWeight.normal,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: font,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
