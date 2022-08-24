import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';

class Cart with ChangeNotifier {
  late List<UserCart> _items;

  List<UserCart> get items {
    return [..._items];
  }
  set items(List<UserCart> input) {
    _items = input;
    notifyListeners();
  }
  UserCart findById(int id) {
    return _items.firstWhere((prod) => prod.product.id == id);
  }

  void addProduct() {
    // _items.add(value);

    notifyListeners();
  }
}
