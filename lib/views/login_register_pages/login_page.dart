import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/resources/assets.gen.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset(Assets.login.path,
                width: double.infinity, height: 350, fit: BoxFit.cover),
            const Positioned(
              bottom: 15,
              left: 15,
              child:
                  TextWidget(title: 'Login', font: 38, weight: FontWeight.bold),
            )
          ],
        ),
        Container(padding: const EdgeInsets.all(15), child: LoginBody()),
      ],
    )));
  }
}
