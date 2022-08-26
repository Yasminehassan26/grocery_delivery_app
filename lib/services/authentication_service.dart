import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_delivery_app/models/user_model.dart';
import 'package:grocery_delivery_app/services/utils.dart';

class AuthenticationService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  bool _currentUser = false;
  UserData? _getUserFromFireBase(auth.User? user) {
    if (user == null) {
      return null;
    }

    return UserData(user.uid, user.email);
  }

  set currentUser(bool val) {
    _currentUser = val;
  }

  bool get currentUser => _currentUser;
  String? getUser() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  UserData? getCurrentUser() {
    final t = _getUserFromFireBase(FirebaseAuth.instance.currentUser);
    (t == null) ? currentUser = false : currentUser = true;

    return t;
  }

  Stream<UserData?> get user {
    return _firebaseAuth.authStateChanges().map(_getUserFromFireBase);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      final checkUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      currentUser = true;
      notifyListeners();
      return true;
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      return false;
    } on Exception catch (e) {
      notifyListeners();

      return true;
    } on Error catch (e) {
      notifyListeners();

      return true;
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      final checkUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      currentUser = true;

      return true;
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);

      return false;
    } on Exception catch (e) {
      notifyListeners();

      return true;
    } on Error catch (e) {
      notifyListeners();

      return true;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    currentUser = false;
    getCurrentUser();
    notifyListeners();
  }
}
