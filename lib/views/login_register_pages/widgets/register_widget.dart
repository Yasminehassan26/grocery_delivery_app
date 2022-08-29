import 'package:flutter/material.dart';
import '../../../services/utils_service.dart';
import 'package:provider/provider.dart';

import '../../../view_models/authentication_view_model.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_button_widget.dart';
import '../../widgets/text_widget.dart';
import 'input_widget.dart';
import 'password_input.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passVController = TextEditingController();

  RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationViewModel>(context);
    void _register() async {
      if (emailController.text == "") {
        Utils.showSnackBar("Please enter a valid email");
      } else if (passController.text == "" || passVController.text == "") {
        Utils.showSnackBar("Please enter a valid password");
      } else if (passController.value != passVController.value) {
        Utils.showSnackBar("the two passwords don't match");
      } else if (await authService.signUp(
          emailController.text, passController.text)) {
        Navigator.pop(context);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(title: 'Register', font: 35, weight: FontWeight.bold),
        const SizedBox(height: 15),
        InputWidget(emailController, 'Email', 'Email can not be empty'),
        PasswordInput(passController, 'Enter a valid password'),
        PasswordInput(passVController, 'Please verify password'),
        const SizedBox(height: 30),
        ElevatedButtonWidget('Register', _register),
        const SizedBox(height: 30),
        Column(
          children: [
            const TextWidget(
                title: 'By creating an account you are agreeing to our'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
