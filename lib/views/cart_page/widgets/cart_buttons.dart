import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user_cart.dart';
import '../../../services/authentication_service.dart';
import '../../../services/cart.dart';
import '../../widgets/text_widget.dart';

class trailingCartWidget extends StatelessWidget {
  const trailingCartWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final UserCart product;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final cart = Provider.of<Cart>(context);

    void increment() {
      cart.incrementProduct(product.product.id, authService.getUser());
    }

    void decrement() {
      cart.decrementProduct(product.product.id, authService.getUser());
    }

    // UserCart p = cart.findById(id);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
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
                  color:Theme.of(context).primaryColor,
                  iconSize: 25,
                  onPressed: decrement,
                  icon: (product.quantity == 1)
                      ? Icon(Icons.delete_outline)
                      : Icon(Icons.remove)),
            ),
          ),
          Container(
            color:Theme.of(context).primaryColor,
            width: 38,
            height: 38,
            child: Center(
              child: TextWidget(
                  title: '${product.quantity}',
                  color: Colors.white,
                  font: 20,
                  weight: FontWeight.bold),
            ),
          ),
          Container(
            width: 40,
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
