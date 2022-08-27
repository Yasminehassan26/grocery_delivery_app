import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoriesService  {

 


  void addCategory() {
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

  Future<List<Category>> getCategories() async {

    QuerySnapshot<Map<String, dynamic>> qShot =
        await FirebaseFirestore.instance.collection('categories').get();
    List<Category> res =
        qShot.docs.map((e) => Category.fromJson(e.data())).toList();
    return res;
  }
}
// 