import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/login_register_pages/login_page.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../services/authentication_service.dart';

class HomeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);

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
              "assets/logo.png",
            ),
          ),
          const SizedBox(width: 10),
          TextWidget(
            title: 'Carrot',
            color: const Color.fromARGB(255, 82, 82, 82),
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
              onPressed: () {
                authService.signOut();
        //          Navigator.of(context).pushReplacementNamed(
        //   LoginPage.routeName,
        // );
              },
            ),
            TextWidget(
              title: 'Home',
              color: const Color.fromARGB(255, 82, 82, 82),
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
