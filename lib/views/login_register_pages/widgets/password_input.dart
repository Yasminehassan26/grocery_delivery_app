import 'package:flutter/material.dart';
// import 'package:password_validator/password_validator.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController textController;
  final String message;
  const PasswordInput(this.textController, this.message, {Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() =>
      _PasswordInputState(textController,message);
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;
  final TextEditingController textController;
  final String message;

  _PasswordInputState(this.textController, this.message);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      obscureText: _isObscure,
      decoration: InputDecoration(
          labelText: 'Password',
          // this button is used to toggle the password visibility
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) {
      //   return value == null ? message : null;
      // },
    );
  }
}
