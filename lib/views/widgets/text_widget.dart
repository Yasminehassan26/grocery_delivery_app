import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  // final String email;
  final String title;
  final double font;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
   const TextWidget(
      {Key? key, required this.title,
      this.font = 14,
      this.color = Colors.black,
      this.weight = FontWeight.normal,
      this.textAlign = TextAlign.left}) : super(key: key);

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
