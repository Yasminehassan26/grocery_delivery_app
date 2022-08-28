import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/cart_view_model.dart';
import 'widgets/cart_appBar.dart';
import 'widgets/cart_grid.dart';
import 'widgets/checkout_button.dart';
import 'widgets/checkout_order.dart';
import 'widgets/empty_cart.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);

    void deleteCart() {
      cart.deleteCart();
    }

    void checkoutCart() {
      cart.checkoutCart();
      Navigator.of(context).pushReplacementNamed(checkoutOrderPage.routeName);
    }

     return Scaffold(
      appBar: CartAppBar(deleteCart),
      body: (cart.items.isEmpty)
          ? const EmptyCart()
          : Column(children: [
              const Expanded(child: CartGrid()),
              checkoutButton(checkoutCart)
            ]),
    );
  }
}
