import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_delivery_app/models/user_cart.dart';
import 'package:grocery_delivery_app/services/cart.dart';
import 'package:grocery_delivery_app/services/categories.dart';
import 'package:grocery_delivery_app/services/products.dart';
import 'package:grocery_delivery_app/views/category_page/categoryPage.dart';
import 'package:grocery_delivery_app/views/product_page/product_page.dart';
import 'package:provider/provider.dart';

import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/views/login_register_pages/login_page.dart';
import 'package:grocery_delivery_app/views/login_register_pages/registration_page.dart';
import 'package:grocery_delivery_app/views/splash_page.dart';

import 'services/user_favorites.dart';
import 'views/main_page/main_page.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (context) => AuthenticationService(),
          ),
          
          ChangeNotifierProvider<Categories>(create:(context)=> Categories()),
          ChangeNotifierProvider<Products>(create:(context)=> Products()),
          ChangeNotifierProvider<UserFavorites>(create:(context)=> UserFavorites()),
          ChangeNotifierProvider<Cart>(create:(context)=> Cart()),

        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashPage(),
            routes: {
              LoginPage.routeName: (ctx) => LoginPage(),
              RegistrationPage.routeName: (ctx) => RegistrationPage(),
              CategoryPage.routeName: (ctx) => CategoryPage(),
              ProductPage.routeName: (ctx) => ProductPage(),
              MainPage.routeName: (ctx) => MainPage(),

            }));
  }
}
