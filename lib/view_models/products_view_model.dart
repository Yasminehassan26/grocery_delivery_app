import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductsViewModel with ChangeNotifier {
  late List<Product> _items;

  List<Product> get items {
    return [..._items];
  }

  set items(List<Product> input) {
    _items = input;
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.name == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
