import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_appBar.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_grid.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/checkout_button.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/checkout_order.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/empty_card.dart';
import 'package:provider/provider.dart';
import '../../services/authentication_service.dart';
import '../../services/cart.dart';
import '../widgets/text_widget.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final authService = Provider.of<AuthenticationService>(context);

    void deleteCart() {
      cart.deleteCart(authService.getUser());
    }

    void checkoutCart() {
      cart.checkoutCart(authService.getUser());
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
