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
  const Wrapper({Key? key}) : super(key: key);
  static const routeName = '/wrapper';

  @override
  Widget build(BuildContext context) {
    print("heloo wrapper");
    final favorites = Provider.of<UserFavorites>(context);
    final cart = Provider.of<Cart>(context);
    return Consumer<AuthenticationService>(
        builder: (context, authService, child) {
      if (authService.currentUser) {
        if (!favorites.initialized) {
          favorites.initializeFavorites(authService.getUser());
          favorites.initialized = true;
        }
        if (!cart.initialized) {
          cart.initializeCart(authService.getUser());
          cart.initialized = true;
        }
        return MainPage();
      } else {
        return LoginPage();
      }
    });
  }
}


// return StreamBuilder<UserData?>(
//         stream: authService.user,
//         builder: (_, AsyncSnapshot<UserData?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               final UserData? user = snapshot.data;
//               print("ohaaaaaaaaaaaaaa");
//               if (!favorites.initialized) {
//                 favorites.initializeFavorites(authService.getUser());
//                 favorites.initialized = true;
//               }
//               if (!cart.initialized) {
//                 cart.initializeCart(authService.getUser());
//                 cart.initialized = true;
//               }
//               return MainPage();
//             } else
//               return LoginPage();
//           } else {
//             return const Scaffold(
//                 body: Center(
//               child: CircularProgressIndicator(),
//             ));
//           }
//         });