import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/login_register_pages/Wrapper_page.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import '../../widgets/elevated_button_widget.dart';

class checkoutOrderPage extends StatelessWidget {
  static const routeName = '/checkout';

  checkoutOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(60),
              child: Image.asset(
                'assets/order.jpg',
                fit: BoxFit.fill,
              ),
            ),
            TextWidget(
                title: "Your Order Has Been Accepted",
                font: 24,
                weight: FontWeight.bold,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
              title: "We’ve accepted your order, and we’re",
              textAlign: TextAlign.center,
              font: 18,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
                title: "getting it ready.",
                font: 18,
                color: Theme.of(context).secondaryHeaderColor,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            ElevatedButtonWidget('Track Order', () => {}),
            TextButton(
              child: TextWidget(
                title: "Back Home",
                weight: FontWeight.bold,
                textAlign: TextAlign.center,
                font: 20,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Wrapper.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}