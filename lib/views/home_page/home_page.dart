import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/profile_page/profile_page.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/carousel_widget.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../models/products.dart';
import '../../services/authentication_service.dart';
import '../main_page/widgets/app_bar_widget.dart';
import '../widgets/elevated_button_widget.dart';
import 'widgets/categories_grid.dart';

class HomePageState extends StatelessWidget {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    void _logOut() async {
      await authService.signOut();
    }

    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselWidget(),
            CategoriesGrid(),
            // ElevatedButtonWidget('log out', _logOut),
          ],
        ),
      ),
    );
  }
}
