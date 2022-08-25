import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_appBar.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_grid.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/empty_card.dart';

import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../services/cart.dart';
import '../widgets/elevated_button_widget.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    if (cart.items.isEmpty) {
      return EmptyCart();
    }
    return Scaffold(
        appBar: CartAppBar(),
        body: Column(children:[ CartGrid()]),
    );
  }
}
