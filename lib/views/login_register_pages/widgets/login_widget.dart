import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/product_model.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_button_widget.dart';
import 'input_widget.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginBody({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);


    void _login() async {
      await authService.signIn(emailController.text, passController.text);
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
              InputWidget(
                  passController, 'Password', 'Password cannot be empty'),
              ButtonWidget('Forgot Password?'),
            ]),
      ),
      ElevatedButtonWidget('Login', _login),
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
