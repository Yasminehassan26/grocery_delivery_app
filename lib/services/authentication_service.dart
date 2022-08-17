import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:grocery_delivery_app/models/user_model.dart';

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

  Future<UserData?> signIn(String email, String password) async {
    final checkUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _getUserFromFireBase(checkUser.user);
  }

  Future<UserData?> signUp(String email, String password) async {
    final checkUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _getUserFromFireBase(checkUser.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
