import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

class Categories with ChangeNotifier {
  final List<Category> _items = [

    // Product(
    //   id: 68,
    //         name: "BBQ Sauce",
    //         weight: "200g",
    //         price: 13.95,
    //         image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
    //         description:
    //             "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    // ),
    //  Product(
    //   id: 68,
    //         name: "BBQ Sauce",
    //         weight: "200g",
    //         price: 13.95,
    //         image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
    //         description:
    //             "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    // ),
    //  Product(
    //   id: 68,
    //         name: "BBQ Sauce",
    //         weight: "200g",
    //         price: 13.95,
    //         image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
    //         description:
    //             "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    // ),
    //  Product(
    //   id: 68,
    //         name: "BBQ Sauce",
    //         weight: "200g",
    //         price: 13.95,
    //         image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
    //         description:
    //             "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    // ),
    //  Product(
    //   id: 68,
    //         name: "BBQ Sauce",
    //         weight: "200g",
    //         price: 13.95,
    //         image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
    //         description:
    //             "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    // ),
  ];

  List<Category> get items {
    return [..._items];
  }

  Category findById(String id) {
    return _items.firstWhere((cat) => cat.name == id);
  }

  void addCategory() {
    // _items.add(value);
    notifyListeners();
  }
}
