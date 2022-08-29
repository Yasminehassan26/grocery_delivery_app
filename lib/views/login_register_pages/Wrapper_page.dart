import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/authentication_view_model.dart';
import '../../view_models/cart_view_model.dart';
import '../../view_models/favorites_view_model.dart';
import '../home_page/main_page.dart';
import 'login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  static const routeName = '/wrapper';

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<UserFavoritesViewModel>(context);
    final cart = Provider.of<CartViewModel>(context);
    return Consumer<AuthenticationViewModel>(
        builder: (context, authService, child) {
      if (authService.currentUser) {
        if (!favorites.initialized) {
          favorites.initializeFavorites();
          favorites.initialized = true;
        }
        if (!cart.initialized) {
          cart.initializeCart();
          cart.initialized = true;
        }
        return const MainPage();
      } else {
        return const LoginPage();
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