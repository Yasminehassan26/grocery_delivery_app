import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../../view_models/cart_view_model.dart';
import 'cart_button.dart';
import 'icon_button.dart';
import '../../product_page/product_page.dart';
import '../../widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<CartViewModel>(context);

    return GridTile(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (() {
              Navigator.of(context).pushNamed(
                ProductPage.routeName,
                arguments: product.name,
              );
            }),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFCFCFC),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.network(product.image),
                  ),
                ),
                Positioned(
                  top: -15,
                  right: -15,
                  child: (cart.containsProduct(product.id))
                      ? CartButton(product.id)
                      : IconButtonCart(product),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
            title: '  \$${product.price}',
            weight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
        TextWidget(title: "  ${product.name}", weight: FontWeight.bold),
        TextWidget(
            title: "  ${product.weight}",
            color: Theme.of(context).secondaryHeaderColor),
      ],
    ));
  }
}
