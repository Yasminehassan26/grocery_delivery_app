import 'package:flutter/material.dart';

import 'text_widget.dart';

class ElevatedButtonWidget extends StatelessWidget {
  // final String email;
  final String title;
  final Function func;
  const ElevatedButtonWidget(this.title, this.func, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          func();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: TextWidget(
            title: title,
            font: 22,
            color: Colors.white,
            weight: FontWeight.bold),
      ),
    );
  }
}
