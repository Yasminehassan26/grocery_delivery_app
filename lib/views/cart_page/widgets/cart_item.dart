import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import 'cart_buttons.dart';

class CartItem extends StatelessWidget {
  double calculate(UserCart product) {
    return double.parse(
        (product.quantity * product.product.price).toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<UserCart>(context);
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          width: width,
          child: ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(5),
              height: double.infinity,
              width: width / 5,
              decoration: BoxDecoration(
                  color: const Color(0xFFFCFCFC),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Center(child: Image.network(product.product.image)),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width / 4,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              title: product.product.name,
                              weight: FontWeight.bold,
                              font: 16),
                          TextWidget(
                              title: product.product.weight,
                              color: Theme.of(context).secondaryHeaderColor,
                              weight: FontWeight.bold,
                              font: 16),
                          TextWidget(
                              title: "\$${calculate(product)}",
                              color: Theme.of(context).primaryColor,
                              weight: FontWeight.bold,
                              font: 16),
                        ],
                      ),
                    ),
                  ),
                  TrailingCartWidget(product: product),
                ]),

            //trailingCartWidget(product: product),
          ),
        ),
        const Divider(
          color: Colors.white,
          thickness: 2,
        )
      ],
    );
  }
}
