import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/view_models/cart_view_model.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_appBar.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_grid.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/checkout_button.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/checkout_order.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/empty_card.dart';
import 'package:provider/provider.dart';


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
          ? EmptyCart()
          : Column(children: [
              Expanded(child: CartGrid()),
              checkoutButton(checkoutCart)
            ]),
    );
  }
}
