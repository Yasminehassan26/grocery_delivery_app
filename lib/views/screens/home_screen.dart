import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/widgets/carousel_widget.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_service.dart';
import '../widgets/app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    void _logOut() async {
      await authService.signOut();
    }

    return Scaffold(
        appBar: AppBarWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselWidget(),
            // ElevatedButtonWidget('log out', _logOut),
            
          ],

        ));
  }
}

