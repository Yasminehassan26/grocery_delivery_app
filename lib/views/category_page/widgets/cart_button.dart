import 'package:flutter/material.dart';
import '../../../models/cart_model.dart';
import '../../../view_models/cart_view_model.dart';
import 'package:provider/provider.dart';

import '../../../services/authentication_service.dart';
import '../../../services/cart_service.dart';
import '../../widgets/text_widget.dart';

class CartButton extends StatelessWidget {
  int id;
  CartButton(this.id);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);

    void increment() {
      cart.incrementProduct(id);
    }

    void decrement() {
      cart.decrementProduct(id);
    }

    UserCart p = cart.findById(id);
    return Column(
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
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0)),
          ),
          child: IconButton(
              color: Theme.of(context).primaryColor,
              iconSize: 25,
              onPressed: decrement,
              icon: const Icon(Icons.remove)),
        ),
        Container(
          width: 38,
          height: 38,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: TextWidget(
                  title: '${p.quantity}',
                  color: Colors.white,
                  font: 20,
                  weight: FontWeight.bold),
            ),
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
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: IconButton(
            color: Theme.of(context).primaryColor,
            iconSize: 25,
            onPressed: increment,
            icon: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
