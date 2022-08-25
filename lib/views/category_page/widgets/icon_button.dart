import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../services/cart.dart';

/// Button that floats over the category item in the [CategoryPage]
class IconButtonCart extends StatelessWidget {
  Product p;
  IconButtonCart(this.p, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to AppState in order to get the products in the user's cart
    final cart = Provider.of<Cart>(context);
    void addToCart() {
      cart.addToCart(p);
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: IconButton(
        iconSize: 25,
        onPressed: addToCart,
        icon: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}
