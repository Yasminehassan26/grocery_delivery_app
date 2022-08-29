import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      Assets.carousel.keyName,
      Assets.carousel.keyName,
      Assets.carousel.keyName,
      Assets.carousel.keyName,
      Assets.carousel.keyName,
      Assets.carousel.keyName,
    ];

    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(item),
          ),
        )
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        // enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
