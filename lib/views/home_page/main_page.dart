import 'package:flutter/material.dart';
import '../campaigns_page/campaigns_page.dart';
import '../cart_page/cart_page.dart';
import 'home_page.dart';
import '../profile_page/profile_page.dart';
import '../search_page/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final screens = [
    const HomePageState(),
    const SearchPage(),
    const CartPage(),
    const CampaignsPage(),
    const ProfilePage(),
  ];
  void _selectScreen(int selectedIndex) {
    if (selectedIndex == 2) {
      Navigator.of(context).pushNamed(
        CartPage.routeName,
      );
    } else {
      setState(() {
        index = selectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (index != 2) {
    return Scaffold(
      body: screens.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).secondaryHeaderColor,
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
    // } else {
    //   return const CartPage();
    // }
  }
}
