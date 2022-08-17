import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  // final String email;
  final String title;

  ButtonWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: TextWidget(title: title, color: Colors.green),
      onPressed: () {},
    );
  }
}
