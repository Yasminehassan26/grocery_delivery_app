import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/products.dart';
import 'package:grocery_delivery_app/views/product_page/widgets/product_appBar_widget.dart';
import 'package:grocery_delivery_app/views/product_page/widgets/product_description.dart';
import 'package:grocery_delivery_app/views/product_page/widgets/product_details.dart';
import 'package:provider/provider.dart';


class ProductPage extends StatelessWidget {
  static const routeName = '/product';

  @override
  Widget build(BuildContext context) {
    final productName =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productName);

    return Scaffold(
      appBar: ProductAppBar(loadedProduct: loadedProduct),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ProductDetails(loadedProduct: loadedProduct),

           DescriptionWidget(loadedProduct: loadedProduct),
          ],
        ),
      ),
      
    );
  }
}




