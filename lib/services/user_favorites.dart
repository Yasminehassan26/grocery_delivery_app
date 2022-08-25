import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

class UserFavorites with ChangeNotifier {
  late List<Product> _items;

  List<Product> get items {
    return [..._items];
  }

  set items(List<Product> input) {
    _items = input;
    notifyListeners();
  }

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

  void initializeFavorites(String? id) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('favorites');
    var doc = await collection.doc(id).get();
    if (doc.exists) {
      items =
          List<Product>.from(doc.get('items').map((x) => Product.fromJson(x)));
    } else {
      items = [];
    }
    notifyListeners();
  }

  void manageFavorites(Product product) async {
    var doc = FirebaseFirestore.instance
        .collection('favorites')
        .doc(FirebaseAuth.instance.currentUser?.uid);
    var snapshot = await doc.get();
    if (snapshot.exists) {

      if (containsProduct(product)) {
        _items.removeWhere((element) => element.id == product.id);
      } else {
        _items.add(product);
      }
      doc.update({
        'items': _items
            .map(
              (item) => item.toJson(),
            )
            .toList(),
      });
    } else {
      print("snap no");

      _items.add(product);

      doc.set({
        'items': _items
            .map(
              (item) => item.toJson(),
            )
            .toList(),
      });
    }

    notifyListeners();
  }
}
