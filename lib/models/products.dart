import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

class Ctego with ChangeNotifier {
  final List<Product> _items = [

    Product(
      id: 68,
            name: "BBQ Sauce",
            weight: "200g",
            price: 13.95,
            image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
            description:
                "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    ),
     Product(
      id: 68,
            name: "BBQ Sauce",
            weight: "200g",
            price: 13.95,
            image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
            description:
                "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    ),
     Product(
      id: 68,
            name: "BBQ Sauce",
            weight: "200g",
            price: 13.95,
            image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
            description:
                "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    ),
     Product(
      id: 68,
            name: "BBQ Sauce",
            weight: "200g",
            price: 13.95,
            image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
            description:
                "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    ),
     Product(
      id: 68,
            name: "BBQ Sauce",
            weight: "200g",
            price: 13.95,
            image: "https://cdn-icons-png.flaticon.com/512/2755/2755300.png",
            description:
                "Our barbecue sauce is a classic sauce with a rich, hickory smoked flavour for traditional barbecue item."
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
