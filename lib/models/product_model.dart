// To parse this JSON data, do
//
//     final Data = DataFromJson(jsonString);

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  int id;
  String name;
  String weight;
  double price;
  String image;
  String description;

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
