import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_delivery_app/models/user_model.dart';
import 'package:grocery_delivery_app/services/utils.dart';

class AuthenticationService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserData? _getUserFromFireBase(auth.User? user) {
    if (user == null) {
      return null;
    }

    return UserData(user.uid, user.email);
  }

  String? getUser() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Stream<UserData?> get user {
    return _firebaseAuth.authStateChanges().map(_getUserFromFireBase);
  }

  Future<bool> signIn(String email, String password) async {
    late final checkUser;
    try {
      checkUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
      return true;
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    late final checkUser;
    try {
      final checkUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
      return true;
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);

      return false;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}
