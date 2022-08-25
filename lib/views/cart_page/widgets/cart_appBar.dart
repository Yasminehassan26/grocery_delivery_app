import 'package:flutter/material.dart';
import '../../main_page/main_page.dart';
import '../../widgets/text_widget.dart';

class CartAppBar extends StatelessWidget with PreferredSizeWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            MainPage.routeName,
          );
        },
        icon: const Icon(Icons.close),
      ),
      title: TextWidget(
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
            //empty cart
          },
        ),
        const SizedBox(width: 5)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
