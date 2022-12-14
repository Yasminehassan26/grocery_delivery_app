import 'package:flutter/material.dart';
import '../../../view_models/cart_view_model.dart';
import 'package:provider/provider.dart';
import '../../../models/cart_model.dart';
import '../../widgets/text_widget.dart';

class TrailingCartWidget extends StatelessWidget {
  const TrailingCartWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final UserCart product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);

    void increment() {
      cart.incrementProduct(product.product.id);
    }

    void decrement() {
      cart.decrementProduct(product.product.id);
    }

    // UserCart p = cart.findById(id);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: (product.quantity == 1)
                ? Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).primaryColor,
                    size: 25,
                  )
                : Icon(
                    Icons.remove,
                    color: Theme.of(context).primaryColor,
                    size: 25,
                  ),
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          width: 38,
          height: 38,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: TextWidget(
                  title: '${product.quantity}',
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
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
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
