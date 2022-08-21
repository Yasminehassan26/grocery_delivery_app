import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String title;
  final String message;

  InputWidget(this.textController, this.title,this.message);
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
      validator: (value){
        return value==null?null:message;
      },
    );
  }
}
