import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

import 'authentication_service.dart';

class UserFavoritesService {
  Future<List<Product>> initializeFavorites() async {
    late List<Product> items;

    CollectionReference collection =
        FirebaseFirestore.instance.collection('favorites');
    var doc = await collection.doc(AuthenticationService.getUser()).get();
    if (doc.exists) {
      items =
          List<Product>.from(doc.get('items').map((x) => Product.fromJson(x)));
    } else {
      items = [];
    }
    return items;
  }

  void manageFavorites(List<Product> items) async {
    var doc = FirebaseFirestore.instance
        .collection('favorites')
        .doc(AuthenticationService.getUser());
    var snapshot = await doc.get();
    if (snapshot.exists) {
     
      doc.update({
        'items': items
            .map(
              (item) => item.toJson(),
            )
            .toList(),
      });
    } else {
      doc.set({
        'items': items
            .map(
              (item) => item.toJson(),
            )
            .toList(),
      });
    }

  }
}
