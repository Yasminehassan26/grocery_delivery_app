import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../services/cart_service.dart';

class CartViewModel with ChangeNotifier {
  late List<UserCart> _items;
  bool _initialized = false;
  CartService cartService = CartService();
  bool get initialized => _initialized;
  set initialized(bool i) {
    _initialized = i;
  }

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

  void incrementProduct(int id) {
    for (var element in _items) {
      if (element.product.id == id) {
        element.quantity++;
      }
    }
    updateCart();
  }

  void decrementProduct(int id) {
    try {
      for (var element in _items) {
        if (element.product.id == id) {
          element.quantity--;
          if (element.quantity == 0) {
            _items.removeWhere((element) => element.product.id == id);
            throw "";
          }
        }
      }
    } catch (e) {
      // leave it
    }
    updateCart();
  }

  Future<void> updateCart() async {
    cartService.updateCart(items);
    notifyListeners();
  }

  bool containsProduct(int product) {
    try {
      findById(product);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> addToCart(Product p) async {
    _items.add(UserCart(quantity: 1, product: p));
    cartService.addToCart(items);
    notifyListeners();
  }

  Future<void> deleteCart() async {
    _items.clear();
    cartService.deleteCart();
    notifyListeners();
  }

  Future<void> initializeCart() async {
    cartService.initializeCart().then((value) {
      items = value;
    });
  }

  void checkoutCart() {
    deleteCart();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _items) {
      totalPrice += item.quantity * item.product.price;
    }
    return totalPrice;
  }
}
