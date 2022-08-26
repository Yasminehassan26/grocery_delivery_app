import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_model.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/services/user_favorites.dart';
import 'package:grocery_delivery_app/views/login_register_pages/login_page.dart';
import 'package:grocery_delivery_app/views/home_page/main_page.dart';
import 'package:provider/provider.dart';

import '../../services/cart.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final favorites = Provider.of<UserFavorites>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    if (authService.getUser() == null) {
      print("user null");

      return LoginPage();
    } else {
      print("ohaaaaaaaaaaaaaa");
      favorites.initializeFavorites(authService.getUser());
      cart.initializeCart(authService.getUser());
      return MainPage();
    }
    // return StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.active) {
    //         // final UserData? user = snapshot.data;
    //         // return user == null ? LoginPage() : MainPage();
    //         if (snapshot.hasData) {
    //           // authService.userId = snapshot.data!.uid;

    //           return MainPage();
    //         } else {
    //           return LoginPage();
    //         }
    //       } else {
    //         return const Scaffold(
    //             body: Center(
    //           child: CircularProgressIndicator(),
    //         ));
    //       }
    //     });
  }
}
