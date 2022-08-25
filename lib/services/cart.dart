import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';

import '../models/product_model.dart';

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

  void incrementProduct(int id) async {
    _items.forEach((element) {
      if (element.product.id == id) {
        element.quantity++;
      }
    });
    await updateCart();
  }

  void decrementProduct(int id) async {
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
    await updateCart();
  }

  Future<void> updateCart() async {
    var doc = FirebaseFirestore.instance
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser?.uid);
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

  void addToCart(Product p) async {
    var doc = FirebaseFirestore.instance
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    var snapshot = await doc.get();

    _items.add(UserCart(quantity: 1, product: p));
    doc.set({
      'items': _items
          .map(
            (item) => item.toJson(),
          )
          .toList(),
    });
    notifyListeners();
  }

  void initializeCart(String? id) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('cart');
    var doc = await collection.doc(id).get();
    if (doc.exists) {
      items = List<UserCart>.from(
          doc.get('items').map((x) => UserCart.fromJson(x)));
    } else {
      items = [];
    }
  }
}
