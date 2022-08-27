// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/widgets.dart';

import '../services/authentication_service.dart';

class AuthenticationViewModel with ChangeNotifier {
  AuthenticationService authService = AuthenticationService();
  bool _currentUser =
      auth.FirebaseAuth.instance.currentUser == null ? false : true;

  set currentUser(bool val) {
    _currentUser = val;
  }

  bool get currentUser => _currentUser;

  Future<void> signIn(String email, String password) async {
    await authService.signIn(email, password).then((value) {
      currentUser = value;
    });

    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    await authService.signUp(email, password).then((value) {
      currentUser = value;
    });
    notifyListeners();
  }

  Future<void> signOut() async {
    await authService.signOut();
    currentUser = false;
    notifyListeners();
  }
}
