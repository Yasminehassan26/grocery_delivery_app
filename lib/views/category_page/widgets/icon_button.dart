import 'package:flutter/material.dart';

/// Button that floats over the category item in the [CategoryPage]
class IconButtonCart extends StatelessWidget {
  const IconButtonCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to AppState in order to get the products in the user's cart

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFFFCFCFC),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: IconButton(
         iconSize: 25,
        onPressed: () {},
        icon: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}
