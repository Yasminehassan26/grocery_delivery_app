import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';

import '../models/product_model.dart';

class Cart with ChangeNotifier {
  late List<UserCart> _items;
   bool _initialized = false;
 set initialized(bool i) {
    _initialized = i;
  }
  bool get initialized =>_initialized;
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

  void incrementProduct(int id, String? uid) async {
    _items.forEach((element) {
      if (element.product.id == id) {
        element.quantity++;
      }
    });
    await updateCart(uid);
  }

  void decrementProduct(int id, String? uid) async {
    try {
      _items.forEach((element) {
        if (element.product.id == id) {
          element.quantity--;
          if (element.quantity == 0) {
            _items.removeWhere((element) => element.product.id == id);
            throw "";
          }
        }
      });
    } catch (e) {
      // leave it
    }
    await updateCart(uid);
  }

  Future<void> updateCart(String? id) async {
    var doc = FirebaseFirestore.instance.collection('cart').doc(id);
    var snapshot = await doc.get();
    if (snapshot.exists) {
      doc.update({
        'items': _items
            .map(
              (item) => item.toJson(),
            )
            .toList(),
      });
    }
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

  Future<void> addToCart(Product p, String? id) async {
    var doc = FirebaseFirestore.instance.collection('cart').doc(id);

    _items.add(UserCart(quantity: 1, product: p));
    await doc.set({
      'items': _items
          .map(
            (item) => item.toJson(),
          )
          .toList(),
    });
    notifyListeners();
  }

  Future<void> deleteCart(String? id) async {
    var doc = FirebaseFirestore.instance.collection('cart').doc(id);
    _items.clear();
    await doc.delete();
    notifyListeners();
  }

  Future<void> initializeCart(String? id) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('cart');
    var doc = await collection.doc(id).get();
    if (doc.exists) {
      items = await List<UserCart>.from(
          doc.get('items').map((x) => UserCart.fromJson(x)));
    } else {
      items = [];
    }
  }

  Future<void> checkoutCart(String? user) async {
    await deleteCart(user);
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    _items.forEach((item) {
      totalPrice += item.quantity * item.product.price;
    });
    return totalPrice;
  }
}
