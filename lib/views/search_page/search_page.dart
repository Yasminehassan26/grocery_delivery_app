import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset('assets/login.jpg',
                width: double.infinity, height: 350, fit: BoxFit.cover),
            const Positioned(
              bottom: 15,
              left: 15,
              child:
                   TextWidget(title: 'Search', font: 38, weight: FontWeight.bold),
            )
          ],
        ),
      ],
    ));
  }
}
