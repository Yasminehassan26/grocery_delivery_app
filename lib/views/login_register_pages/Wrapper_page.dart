import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/user_model.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/services/user_favorites.dart';
import 'package:grocery_delivery_app/views/login_register_pages/login_page.dart';
import 'package:grocery_delivery_app/views/main_page/main_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);

    return StreamBuilder<UserData?>(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // final UserData? user = snapshot.data;
            // return user == null ? LoginPage() : MainPage();
            if (snapshot.hasData) {
              authService.userId = snapshot.data!.id;
              // favorites.favorites(snapshot.data!.id);
              return MainPage();
            } else {
              return LoginPage();
            }
          } else {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
