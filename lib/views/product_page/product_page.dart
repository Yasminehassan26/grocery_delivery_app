import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/cart_view_model.dart';
import '../../view_models/products_view_model.dart';
import '../widgets/elevated_button_widget.dart';
import 'widgets/product_appBar_widget.dart';
import 'widgets/product_cart.dart';
import 'widgets/product_description.dart';
import 'widgets/product_details.dart';


class ProductPage extends StatelessWidget {
  static const routeName = '/product';

  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productName =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<ProductsViewModel>(
      context,
      listen: false,
    ).findById(productName);
    final cart = Provider.of<CartViewModel>(context);
    void addToCart()  {
       cart.addToCart(loadedProduct);
    }

    return Scaffold(
      appBar: ProductAppBar(loadedProduct: loadedProduct),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductDetails(loadedProduct: loadedProduct),
                    DescriptionWidget(loadedProduct: loadedProduct),
                  ],
                ),
              ),
            ),
          ),
          (!cart.containsProduct(loadedProduct.id))
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButtonWidget("Add to Cart", addToCart),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileCartButton(
                      product: loadedProduct,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
