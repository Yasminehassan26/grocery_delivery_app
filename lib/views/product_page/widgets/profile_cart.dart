import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../../models/user_cart.dart';
import '../../../services/authentication_service.dart';
import '../../../services/cart.dart';
import '../../widgets/text_widget.dart';

class ProfileCartButton extends StatelessWidget {
  const ProfileCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final cart = Provider.of<Cart>(context);
    UserCart cartProduct = cart.findById(product.id);
    void increment() {
      cart.incrementProduct(cartProduct.product.id, authService.getUser());
    }

    void decrement() {
      cart.decrementProduct(cartProduct.product.id, authService.getUser());
    }

    // UserCart p = cart.findById(id);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFCFCFC),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: Center(
              child: IconButton(
                  color: Theme.of(context).primaryColor,
                  iconSize: 25,
                  onPressed: decrement,
                  icon: (cartProduct.quantity == 1)
                      ? Icon(Icons.delete_outline)
                      : Icon(Icons.remove)),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            width: 60,
            height: 39,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: TextWidget(
                    title: '${cartProduct.quantity}',
                    color: Colors.white,
                    font: 20,
                    weight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFCFCFC),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
              ),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ),
            child: Center(
              child: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: 25,
                onPressed: increment,
                icon: Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
