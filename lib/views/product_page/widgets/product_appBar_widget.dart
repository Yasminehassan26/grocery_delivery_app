import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../view_models/favorites_view_model.dart';
import '../../widgets/text_widget.dart';

class ProductAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProductAppBar({
    Key? key,
    required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;
  void find() async {}
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<UserFavoritesViewModel>(context);
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: TextWidget(
          title: loadedProduct.name,
          weight: FontWeight.bold,
          font: 20,
        ),
      ),
      actions: [
        IconButton(
          iconSize: 35,
          icon: (favorites.containsProduct(loadedProduct))
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                ),
          onPressed: () {
            favorites.manageFavorites(loadedProduct);
          },
        ),
        const SizedBox(width: 5)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
