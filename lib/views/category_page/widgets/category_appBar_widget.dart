import 'package:flutter/material.dart';

import '../../../models/category_model.dart';
import '../../widgets/text_widget.dart';

class CategoryAppBar extends StatelessWidget with PreferredSizeWidget {
  const CategoryAppBar({
    Key? key,
    required this.loadedCategory,
  }) : super(key: key);

  final Category loadedCategory;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      title: FittedBox(
          fit: BoxFit.scaleDown,
          child: TextWidget(
            title: loadedCategory.name,
            weight: FontWeight.bold,
            font: 20,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
