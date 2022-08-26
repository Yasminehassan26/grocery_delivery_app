import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/cart.dart';
import '../../widgets/text_widget.dart';

class checkoutButton extends StatelessWidget {
  Function func;
  checkoutButton(this.func, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
 double getTotalPrice( ) {
    return double.parse(
        (cart.getTotalPrice()).toStringAsFixed(2));
  }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: TextWidget(
                    title: "\$${getTotalPrice()}",
                    weight: FontWeight.bold,
                    font: 20),
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    func();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary:Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                  ),
                  child: TextWidget(
                      title: "Checkout",
                      font: 22,
                      color: Colors.white,
                      weight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
