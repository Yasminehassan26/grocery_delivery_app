import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/utils_service.dart';
import '../../../view_models/authentication_view_model.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_button_widget.dart';
import '../../widgets/text_widget.dart';
import 'input_widget.dart';
import 'password_input.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginBody({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationViewModel>(context);

    void _login() {
      if (emailController.text == "") {
        Utils.showSnackBar("Please enter a valid email");
      } else if (passController.text == "") {
        Utils.showSnackBar("Please enter a valid password");
      } else {
        authService.signIn(emailController.text, passController.text);
      }
      // await addProducts();
    }

    return Column(children: [
      Form(
        key: _key,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputWidget(emailController, 'Email', 'Email cannot be empty'),
              PasswordInput(passController, 'Password cannot be empty'),
              const ButtonWidget('Forgot Password?'),
            ]),
      ),
      ElevatedButtonWidget('Login', _login),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(title: 'Don\'t have any account?'),
          TextButton(
            child: TextWidget(
              title: 'Create one',
              font: 20,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        ],
      ),
    ]);
  }
}
