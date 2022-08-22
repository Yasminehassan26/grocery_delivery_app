import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/categories.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/carousel_widget.dart';
import 'package:provider/provider.dart';
import '../../services/authentication_service.dart';
import '../home_page/widgets/app_bar_widget.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final categoryName =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedCategory = Provider.of<Categories>(
      context,
      listen: false,
    ).findById(categoryName);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedCategory.name),
      ),
    );
  }
}
