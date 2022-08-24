import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:grocery_delivery_app/models/user_model.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  late String _userID;

  UserData? _getUserFromFireBase(auth.User? user) {
    if (user == null) {
      return null;
    }

    return UserData(user.uid, user.email);
  }

  set userId(String id) {
    _userID = id;
  }

  String get userId => _userID;

  Stream<UserData?> get user {
    return _firebaseAuth.authStateChanges().map(_getUserFromFireBase);
  }

  Future<bool> signIn(String email, String password) async {
    late final checkUser;
    try {
      checkUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      userId = checkUser.user.uid;
      return true;
    } on auth.FirebaseAuthException catch (e) {
      return false;
    }
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
