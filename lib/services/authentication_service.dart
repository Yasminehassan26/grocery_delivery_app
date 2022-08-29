// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_delivery_app/models/user_model.dart';
import 'package:grocery_delivery_app/services/utils_service.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserData? _getUserFromFireBase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserData(user.uid, user.email);
  }

  Stream<UserData?> get user {
    return _firebaseAuth.authStateChanges().map(_getUserFromFireBase);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      return false;
    }
  
  }

  Future<bool> signUp(String email, String password) async {
    try {
       await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      return false;
    }
    
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static String? getUser() {
    String? res = FirebaseAuth.instance.currentUser?.uid;

    return res;
  }

 
}
