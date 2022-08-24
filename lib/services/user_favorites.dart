import 'package:cloud_firestore/cloud_firestore.dart';
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

  bool containsId(Product product) {
    return _items.contains(product);
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void favorites(String id) async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('favorites');
    var doc = await collection.doc(id).get();
    if (doc.exists) {
      items =
          List<Product>.from(doc.get('items').map((x) => Product.fromJson(x)));
    } else {
      items = [];
    }
  }

  void manageFavorites(String userId, Product product) async {
    var doc = FirebaseFirestore.instance.collection('favorites').doc(userId);
    var snapshot = await doc.get();
    if (snapshot.exists) {
      if (containsId(product)) {
        _items.remove(product);
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
