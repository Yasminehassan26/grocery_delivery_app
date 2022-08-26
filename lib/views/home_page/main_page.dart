import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/campaigns_page/campaigns_page.dart';
import 'package:grocery_delivery_app/views/cart_page/cart_page.dart';
import 'package:grocery_delivery_app/views/home_page/home_page.dart';
import 'package:grocery_delivery_app/views/cart_page/widgets/cart_appBar.dart';
import 'package:grocery_delivery_app/views/profile_page/profile_page.dart';
import 'package:grocery_delivery_app/views/search_page/search_page.dart';
import 'widgets/home_appbar_widget.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/main';

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int index = 0;

  final screens = [
    //add differentPages
    HomePageState(),
    SearchPage(),
    CartPage(),
    CampaignsPage(),
    ProfilePage(),
  ];
  void _selectScreen(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (index != 2) {
      return Scaffold(
        body: screens.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:Theme.of(context).primaryColor,
          unselectedItemColor:Theme.of(context).secondaryHeaderColor,
          showUnselectedLabels: true,
          currentIndex: index,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sell_outlined), label: "Campaigns"),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined), label: "Profile"),
          ],
        ),
      );
    } else {
      return CartPage();
    }
  }
}
