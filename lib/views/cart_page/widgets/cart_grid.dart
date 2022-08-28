import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/cart_view_model.dart';
import 'cart_item.dart';

class CartGrid extends StatelessWidget {
  const CartGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartViewModel>(context).items;
    return ListView.separated(
      // shrinkWrap: true,
      itemCount: cartItems.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 1,
        thickness: 1,
      ),
      itemBuilder: (ctx, i) => CartItem(cartItems[i]),
    );
  }
}
