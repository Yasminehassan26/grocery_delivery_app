import 'package:flutter/material.dart';
import '../../widgets/text_widget.dart';

import '../../../gen/assets.gen.dart';

class HomeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      title: Row(
        children: [
          Container(
            width: 40,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
              )
            ]),
            child: Image.asset(
              fit: BoxFit.cover,
              Assets.logoo.keyName,
            ),
          ),
          const SizedBox(width: 10),
          const TextWidget(
            title: 'Carrot',
            color: Color.fromARGB(255, 82, 82, 82),
            font: 20,
            weight: FontWeight.w500,
          )
        ],
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.place,
                  color: Color.fromARGB(255, 82, 82, 82)),
              onPressed: () {},
            ),
            const TextWidget(
              title: 'Home',
              color: Color.fromARGB(255, 82, 82, 82),
              font: 18,
              weight: FontWeight.w500,
            ),
            const SizedBox(width: 20),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
