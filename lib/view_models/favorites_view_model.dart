import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import '../models/product_model.dart';
import '../services/favorites.dart';

class UserFavoritesViewModel with ChangeNotifier {
  late List<Product> _items;
  bool _initialized = false;
  UserFavoritesService favoritesService = UserFavoritesService();
  List<Product> get items {
    return [..._items];
  }

  set items(List<Product> input) {
    _items = input;
    notifyListeners();
  }

  set initialized(bool i) {
    _initialized = i;
  }

  bool get initialized => _initialized;

  bool containsProduct(Product product) {
    try {
      findById(product.id);
      return true;
    } catch (e) {
      return false;
    }
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> initializeFavorites() async {
    await favoritesService.initializeFavorites().then(
      (value) {
        items = value;
      },
    );
    notifyListeners();
  }

  Future<void> manageFavorites(Product product) async {
   
    
      if (containsProduct(product)) {
        _items.removeWhere((element) => element.id == product.id);
      } else {
        _items.add(product);
      }
     favoritesService.manageFavorites(items);

    notifyListeners();
  }
}
