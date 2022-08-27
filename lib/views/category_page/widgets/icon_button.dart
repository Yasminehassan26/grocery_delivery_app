import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/view_models/cart_view_model.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';


/// Button that floats over the category item in the [CategoryPage]
class IconButtonCart extends StatelessWidget {
  final Product p;
  const IconButtonCart(this.p, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);

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
        icon: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
