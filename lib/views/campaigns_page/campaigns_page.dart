import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/carousel_widget.dart';
import '../widgets/text_widget.dart';

class CampaignsPage extends StatelessWidget {
  CampaignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: const FittedBox(
            fit: BoxFit.scaleDown,
            child: TextWidget(
              title: "Campaigns",
              weight: FontWeight.bold,
              font: 20,
            )),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CarouselWidget()],
      )),
    );
  }
}
