import 'package:flutter/material.dart';
import '../../../view_models/authentication_view_model.dart';
import 'password_input.dart';
import '../../widgets/text_button_widget.dart';
import '../../widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/elevated_button_widget.dart';
import 'input_widget.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passVController = TextEditingController();

   RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationViewModel>(context);
    void _register(){
      authService.signUp(emailController.text, passController.text);
      Navigator.pop(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(title: 'Register', font: 35, weight: FontWeight.bold),
        const SizedBox(height: 15),
        InputWidget(emailController, 'Email', 'Email can not be empty'),
        PasswordInput(passController, 'Enter a valid password'),
        PasswordInput(passVController, 'Please verify password'),
        const SizedBox(height: 30),
        ElevatedButtonWidget('Register', _register),
        const SizedBox(height: 30),
        Column(
          children: [
            TextWidget(title: 'By creating an account you are agreeing to our'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget('Terms of services'),
                TextWidget(title: 'and'),
                ButtonWidget('Privacy Policy'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
