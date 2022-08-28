import 'package:flutter/material.dart';
import '../../../view_models/categories_view_model.dart';
import 'carousel_widget.dart';
import 'category_item.dart';
import 'package:provider/provider.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoriesViewModel>(context);
    final categories = categoriesData.items;
    return Column(
      children: [
        const CarouselWidget(),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: categories[i],
              child: const Card(elevation: 5, child: CategoryItem()),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}
