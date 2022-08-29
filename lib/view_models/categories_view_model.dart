import 'package:flutter/material.dart';
import '../services/categories_service.dart';
import '../models/category_model.dart';

class CategoriesViewModel with ChangeNotifier {
  late List<Category> _items;
  CategoriesService categoriesService = CategoriesService();

  List<Category> get items {
    return _items;
  }

  set items(List<Category> input) {
    _items = input;
  }

  Category findById(String id) {
    return _items.firstWhere((cat) => cat.name == id);
  }

  void addCategory() {
    // _items.add(value);
    notifyListeners();
  }

  Future<List<Category>> get categories async {
    Future<List<Category>> res = categoriesService.getCategories();
    res.then((value) {
      items = value;
    });
    return res;
  }
}
// 