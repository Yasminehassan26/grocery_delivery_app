import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
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
            Image.asset('assets/login.jpg',
                width: double.infinity, height: 350, fit: BoxFit.cover),
            Positioned(
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
