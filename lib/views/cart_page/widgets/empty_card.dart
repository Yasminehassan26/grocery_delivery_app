import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/login_register_pages/Wrapper_page.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import '../../widgets/elevated_button_widget.dart';

class EmptyCart extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60),
              child: Image.asset(
                'assets/cart.jpg',
                fit: BoxFit.fill,
              ),
            ),
            TextWidget(
                title: "Your cart is empty",
                font: 24,
                weight: FontWeight.bold,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
              title: "Looks like you haven’t made",
              textAlign: TextAlign.center,
              font: 20,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
                title: "your choice yet...",
                font: 20,
                color: Theme.of(context).secondaryHeaderColor,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            ElevatedButtonWidget(
                'Start Shopping',
                () => {
                      Navigator.of(context)
                          .pushReplacementNamed(Wrapper.routeName)
                    }),
          ],
        ),
    );
  }
}
