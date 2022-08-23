import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_delivery_app/models/categories.dart';
import 'package:grocery_delivery_app/models/products.dart';
import 'package:grocery_delivery_app/views/category_page/categoryPage.dart';
import 'package:grocery_delivery_app/views/product_page/product_page.dart';
import 'package:provider/provider.dart';

import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/views/login_register_pages/login_page.dart';
import 'package:grocery_delivery_app/views/login_register_pages/registration_page.dart';
import 'package:grocery_delivery_app/views/splash_page.dart';

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
            create: (_) => AuthenticationService(),
          ),
          ChangeNotifierProvider<Categories>.value(value: Categories()),
          ChangeNotifierProvider<Products>.value(value: Products()),

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

            }));
  }
}
