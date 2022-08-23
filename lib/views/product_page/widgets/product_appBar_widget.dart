import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

import '../../../models/category_model.dart';
import '../../widgets/text_widget.dart';

class ProductAppBar extends StatelessWidget with PreferredSizeWidget {
  const ProductAppBar({
    Key? key,
    required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  Widget build(BuildContext context) {
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
      title:TextWidget(title: loadedProduct.name,weight: FontWeight.bold,font: 20,),
       actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border,),   
       onPressed: () {
          },
        ),
        const SizedBox(width: 5)
      ],
    );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
