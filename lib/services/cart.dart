import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';

class CartService {
  Future<void> updateCart(List<UserCart> items) async {
    var doc = FirebaseFirestore.instance
        .collection('cart')
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
    }
  }

  Future<void> addToCart(List<UserCart> items) async {
    var doc = FirebaseFirestore.instance
        .collection('cart')
        .doc(AuthenticationService.getUser());

    await doc.set({
      'items': items
          .map(
            (item) => item.toJson(),
          )
          .toList(),
    });
  }

  Future<void> deleteCart() async {
    var doc = FirebaseFirestore.instance
        .collection('cart')
        .doc(AuthenticationService.getUser());
    await doc.delete();
  }

  Future<List<UserCart>> initializeCart() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('cart');
    var doc = await collection.doc(AuthenticationService.getUser()).get();
    late List<UserCart> items;
    if (doc.exists) {
      items = await List<UserCart>.from(
          doc.get('items').map((x) => UserCart.fromJson(x)));
    } else {
      items = [];
    }
    return items;
  }
}
