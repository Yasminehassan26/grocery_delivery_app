import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import '../login_register_pages/widgets/login_widget.dart';

class CampaignsPage extends StatelessWidget {
  CampaignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
      ],
    ));
  }
}
