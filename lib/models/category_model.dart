import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

List<Category> DataFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String DataToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category with ChangeNotifier {
  final String name;
  final String image;
  final List<Product> items;

  Category({
    required this.name,
    required this.image,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        image: json["image"],
        items:
            List<Product>.from(json["items"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
