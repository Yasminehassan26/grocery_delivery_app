import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFFCFCFC),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
            ),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0)),
          ),
          child: Center(
            child: IconButton(
                color: Colors.green,
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.remove)),
          ),
        ),

        Container(
          width: 40,
          height: 40,
          color:Colors.green,
          child:  Center(
            child: TextWidget(title: "30",color: Colors.white,
                  font: 20,
                  weight: FontWeight.bold),
            
          ),
        ),
        // * Add one to cart Button
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFFCFCFC),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
            ),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: Center(
            child: IconButton(
              color: Colors.green,
              iconSize: 25,
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
