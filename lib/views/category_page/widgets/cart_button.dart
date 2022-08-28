import 'package:flutter/material.dart';
import '../../../models/cart_model.dart';
import '../../../view_models/cart_view_model.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_widget.dart';

class CartButton extends StatelessWidget {
  final int id;
  const CartButton(this.id, {Key? key}) : super(key: key);

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
        InkWell(
          onTap: decrement,
          child: Container(
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
            child: Icon(
              Icons.remove,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
          ),
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
        InkWell(
          onTap: increment,
          child: Container(
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
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
          
          ),
        )
      ],
    );
  }
}
