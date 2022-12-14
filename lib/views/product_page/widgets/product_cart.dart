import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../../view_models/cart_view_model.dart';
import 'package:provider/provider.dart';
import '../../../models/cart_model.dart';
import '../../widgets/text_widget.dart';

class ProfileCartButton extends StatelessWidget {
  const ProfileCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartViewModel>(context);
    UserCart cartProduct = cart.findById(product.id);
    void increment() {
      cart.incrementProduct(cartProduct.product.id);
    }

    void decrement() {
      cart.decrementProduct(cartProduct.product.id);
    }

    // UserCart p = cart.findById(id);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: decrement,
            child: Container(
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
              child: (cartProduct.quantity == 1)
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
          InkWell(
            onTap: increment,
            child: Container(
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
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
