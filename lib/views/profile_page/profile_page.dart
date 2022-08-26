import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_app/views/profile_page/widgets/listTile_widget.dart';
import 'package:grocery_delivery_app/views/profile_page/widgets/toggle_button.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TextWidget(
            title: "Profile",
            weight: FontWeight.bold,
            font: 20,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  title: "Account",
                  color: Theme.of(context).primaryColor,
                  weight: FontWeight.bold,
                ),
                listTileWidget('assets/profileIcons/profile.svg',
                    "Edit Profile", Icons.arrow_forward_ios),
                listTileWidget('assets/profileIcons/key.svg', "Change Password",
                    Icons.arrow_forward_ios),
                const SizedBox(
                  height: 30,
                ),
                TextWidget(
                  title: "General",
                  color: Theme.of(context).primaryColor,
                  weight: FontWeight.bold,
                ),
                listTileWidget('assets/profileIcons/orders.svg', "Orders",
                    Icons.arrow_forward_ios),
                listTileWidget('assets/profileIcons/favorite.svg', "Favorites",
                    Icons.arrow_forward_ios),
                listTileWidget('assets/profileIcons/location.svg',
                    "My Addresses", Icons.arrow_forward_ios),
                listTileWidget('assets/profileIcons/cards.svg', "My Cards",
                    Icons.arrow_forward_ios),
                const SizedBox(
                  height: 30,
                ),
                TextWidget(
                  title: "App Settings",
                  color: Theme.of(context).primaryColor,
                  weight: FontWeight.bold,
                ),
                ToggleButton(
                    'assets/profileIcons/notification.svg', "Notifications"),
                ToggleButton('assets/profileIcons/mode.svg', "Dark Mode"),
                ListTile(
                  leading: SvgPicture.asset('assets/profileIcons/language.svg'),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: 'Language',
                        color: Theme.of(context).secondaryHeaderColor,
                        font: 18,
                      ),
                      Row(children: [
                        TextWidget(
                          title: "English",
                          font: 16,
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ]),
                    ],
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset('assets/profileIcons/logout.svg'),
                  title: TextWidget(
                    title: 'Logout',
                    color: Theme.of(context).secondaryHeaderColor,
                    font: 18,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
