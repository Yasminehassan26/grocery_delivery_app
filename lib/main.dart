import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/categories.dart';
import 'view_models/authentication_view_model.dart';
import 'view_models/products_view_model.dart';
import 'services/utils.dart';
import 'view_models/cart_view_model.dart';
import 'view_models/favorites_view_model.dart';
import 'views/cart_page/widgets/checkout_order.dart';
import 'views/category_page/categoryPage.dart';
import 'views/login_register_pages/Wrapper_page.dart';
import 'views/product_page/product_page.dart';
import 'package:provider/provider.dart';
import 'views/login_register_pages/login_page.dart';
import 'views/login_register_pages/registration_page.dart';
import 'views/splash_page.dart';

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
          ChangeNotifierProvider<AuthenticationViewModel>(
              create: (context) => AuthenticationViewModel()),
          ChangeNotifierProvider<Categories>(create: (context) => Categories()),
          ChangeNotifierProvider<ProductsViewModel>(
              create: (context) => ProductsViewModel()),
          ChangeNotifierProvider<UserFavoritesViewModel>(
              create: (context) => UserFavoritesViewModel()),
          ChangeNotifierProvider<CartViewModel>(
              create: (context) => CartViewModel()),
        ],
        child: MaterialApp(
            scaffoldMessengerKey: Utils.messengerKey,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.green,
              secondaryHeaderColor: Colors.grey,
              backgroundColor: const Color(0xffE5E5E5),
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            // themeMode: ThemeMode.dark,

            home: const SplashPage(),
            routes: {
              LoginPage.routeName: (ctx) => const LoginPage(),
              RegistrationPage.routeName: (ctx) => const RegistrationPage(),
              CategoryPage.routeName: (ctx) => CategoryPage(),
              ProductPage.routeName: (ctx) => const ProductPage(),
              Wrapper.routeName: (ctx) => const Wrapper(),
              checkoutOrderPage.routeName: (ctx) => checkoutOrderPage(),
            }));
  }
}
