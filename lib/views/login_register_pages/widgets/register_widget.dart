import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/widgets/text_button_widget.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../../services/authentication_service.dart';
import '../../widgets/elevated_button_widget.dart';
import 'input_widget.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passVController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    void _register() async {
      await authService.signUp(emailController.text, passController.text);
      Navigator.pop(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(title: 'Register', font: 35, weight: FontWeight.bold),
        const SizedBox(height: 15),
        InputWidget(emailController, 'Email', 'Email canoot be empty'),
        InputWidget(passController, 'Password', 'Password cannot be empty'),
        InputWidget(
            passVController, 'Verify Password', 'Please verify password'),
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
