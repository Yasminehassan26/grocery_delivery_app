

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final int id;
  final String name;
  final String weight;
  final double price;
  final String image;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.weight,
    required this.price,
    required this.image,
    required this.description,
  });

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        price: json["price"].toDouble(),
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "weight": weight,
        "price": price,
        "image": image,
        "description": description,
      };
}
