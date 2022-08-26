import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

List<UserCart> userCartFromJson(String str) => List<UserCart>.from(json.decode(str).map((x) => UserCart.fromJson(x)));

String userCartToJson(List<UserCart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCart  with ChangeNotifier {
    UserCart({
        required this.quantity,
        required this.product,
    });

     int quantity;
    final Product product;

    factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product.toJson(),
    };
}