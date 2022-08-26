import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/services/categories.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/carousel_widget.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/home_appbar_widget.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../models/category_model.dart';

import '../../services/authentication_service.dart';
import '../../services/cart.dart';
import '../../services/user_favorites.dart';
import 'widgets/categories_grid.dart';

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final favorites = Provider.of<UserFavorites>(context);
    final cart = Provider.of<Cart>(context);
    final authService = Provider.of<AuthenticationService>(context);

    return Scaffold(
      appBar: HomeAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselWidget(),
          FutureBuilder<List<Category>>(
              future: categoriesData.categories,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return TextWidget(title: "error");
                } else if (snapshot.hasData) {
                  categoriesData.items = snapshot.data!;
                  // favorites.initializeFavorites(authService.userId);
                  // cart.initializeCart(authService.userId);
                  return CategoriesGrid();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
