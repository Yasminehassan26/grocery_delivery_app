import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/models/product_model.dart';

class Categories with ChangeNotifier {
  late List<Category> _items;

  List<Category> get items {
    return _items;
  }

  set items(List<Category> input) {
    _items = input;
    notifyListeners();
  }

  Category findById(String id) {
    return _items.firstWhere((cat) => cat.name == id);
  }

  void addCategory() {
    // _items.add(value);
    notifyListeners();
  }

  // Stream<List<Category>> get categories {
  //   Stream<List<Category>> res = FirebaseFirestore.instance
  //       .collection("categories")
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return Category.fromJson(doc.data());
  //     }).toList();
  //   });
  //   return res;
  // }

  Future<List<Category>> get categories async {
    QuerySnapshot<Map<String, dynamic>> qShot =
        await FirebaseFirestore.instance.collection('categories').get();
    List<Category> res =
        qShot.docs.map((e) => Category.fromJson(e.data())).toList();
    items = res;
    return res;
  }
}
// 
