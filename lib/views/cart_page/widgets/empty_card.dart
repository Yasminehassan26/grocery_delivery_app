import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_appBar.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';

import '../../main_page/main_page.dart';
import '../../widgets/elevated_button_widget.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(),
      body: Padding(
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
              color: Colors.grey,
            ),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
                title: "your choice yet...",
                font: 20,
                color: Colors.grey,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            ElevatedButtonWidget(
                'Start Shopping',
                () => {
                      Navigator.of(context).pushNamed(
                        MainPage.routeName,
                      )
                    }),
          ],
        ),
      ),
    );
  }
}
