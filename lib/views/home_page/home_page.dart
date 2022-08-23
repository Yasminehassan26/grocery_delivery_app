import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/categories.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/carousel_widget.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import '../../models/category_model.dart';
import '../../services/authentication_service.dart';
import '../main_page/widgets/home_appbar_widget.dart';
import 'widgets/categories_grid.dart';

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);

    return Scaffold(
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
                  // categoriesData.items = snapshot.data!;
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
