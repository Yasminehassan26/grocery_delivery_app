import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';

import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<UserCart>(context);
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ListTile(
          // visualDensity: const VisualDensity(vertical: 4),
          leading: Container(
            height: double.infinity,
            width: width / 5,
            decoration: BoxDecoration(
                color: const Color(0xFFFCFCFC),
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Image.network(product.product.image),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  title: product.product.name,
                  weight: FontWeight.bold,
                  font: 18),
              TextWidget(
                  title: product.product.weight,
                  color: Colors.grey,
                  weight: FontWeight.bold,
                  font: 16),
              TextWidget(
                  title: "\$${product.quantity * product.product.price}",
                  color: Colors.green,
                  weight: FontWeight.bold,
                  font: 18),
            ],
          ),

          trailing: SizedBox(
            child: Row(children: [
              Icon(Icons.more_vert),
              Icon(Icons.more_vert),
              Icon(Icons.more_vert),
            ]),
          ),

          //trailingCartWidget(product: product),
        ),
        const Divider(
          color: Color(0xffe0e0e0),
          thickness: 2,
        )
      ],
    );
  }
}

class trailingCartWidget extends StatelessWidget {
  const trailingCartWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final UserCart product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            // width: 34,
            // height: 32,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    color: const Color(0xff006f18).withAlpha(30))
              ],
              color: Colors.white,
            ),
            child: IconButton(
                splashColor: Colors.transparent,
                iconSize: 17,
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                icon: product.quantity == 1
                    ? const Icon(Icons.delete_outline)
                    : const Icon(Icons.remove)),
          ),
          Container(
            // width: 34,
            // height: 32,
            color: Colors.green,
            child: Center(
              child: Text(
                product.quantity.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            // width: 34,
            // height: 32,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    color: const Color(0xff006f18).withAlpha(30))
              ],
              color: Colors.white,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              iconSize: 17,
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
