import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import 'elevated_button_widget.dart';
import 'text_button_widget.dart';
import 'input_widget.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    void _login() async {
    await authService.signIn(emailController.text, passController.text);
    }

    return Column(children: [
      Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputWidget(emailController, 'Email'),
            InputWidget(passController, 'Password'),
            ButtonWidget('Forgot Password?'),
          ]),
      ElevatedButtonWidget('Login',_login),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(title: 'Don\'t have any account?', font: 20),
          TextButton(
            child: TextWidget(
              title: 'Create one',
              font: 20,
              color: Colors.green,
            ),
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        ],
      ),
    ]);
  }
}
