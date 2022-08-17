import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String title;
  InputWidget(this.textController, this.title);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
      labelText: title,
      ),
    );
  }
}
