import 'package:flutter/material.dart';
import '../../view_models/categories_view_model.dart';
import '../../models/category_model.dart';
import '../../services/categories_service.dart';
import 'widgets/carousel_widget.dart';
import 'widgets/home_appbar_widget.dart';
import '../widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/categories_grid.dart';

class HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoriesViewModel>(context);

    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<Category>>(
              future: categoriesData.categories,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return TextWidget(title: "error");
                } else if (snapshot.hasData) {
                  categoriesData.items = snapshot.data!;

                  return Expanded(child: CategoriesGrid());
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
