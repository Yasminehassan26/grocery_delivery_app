import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/services/cart.dart';
import 'package:provider/provider.dart';
import 'cart_item.dart';

class CartGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context).items;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cartItems.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: cartItems[i],
        child: CartItem(),
      ),
    );
  }
}
