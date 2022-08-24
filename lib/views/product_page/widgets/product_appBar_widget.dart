import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/product_model.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:provider/provider.dart';
import '../../../services/user_favorites.dart';
import '../../widgets/text_widget.dart';

class ProductAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProductAppBar({
    Key? key,
    required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<UserFavorites>(context);
    final userId = Provider.of<AuthenticationService>(context);

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
      title: TextWidget(
        title: loadedProduct.name,
        weight: FontWeight.bold,
        font: 20,
      ),
      actions: [
        IconButton(
          icon: (favorites.containsId(loadedProduct))
              ? const Icon(Icons.favorite,color: Colors.red,)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            favorites.manageFavorites(userId.userId, loadedProduct);
          },
        ),
        const SizedBox(width: 5)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
