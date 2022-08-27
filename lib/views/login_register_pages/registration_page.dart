import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/login_register_pages/widgets/register_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(15), child: RegisterWidget()));
  }
}
