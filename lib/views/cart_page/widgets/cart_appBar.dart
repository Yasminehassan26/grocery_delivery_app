import 'package:flutter/material.dart';
import '../../widgets/text_widget.dart';

class CartAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function function;
  CartAppBar(this.function, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).
         pop();
        },
        icon: const Icon(Icons.close),
      ),
      title: const TextWidget(
        title: "Cart",
        weight: FontWeight.bold,
        font: 20,
      ),
      actions: [
        IconButton(
          iconSize: 25,
          icon: const Icon(
            Icons.delete_outline,
          ),
          onPressed: () {
            function();
          },
        ),
        const SizedBox(width: 5)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
