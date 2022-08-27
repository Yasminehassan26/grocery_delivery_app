import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets.gen.dart';
import 'widgets/listTile_widget.dart';
import 'widgets/toggle_button.dart';
import '../widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../view_models/authentication_view_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title:  const TextWidget(
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
                ListTileWidget(Assets.profileIcons.profile,
                    "Edit Profile", Icons.arrow_forward_ios),
                 ListTileWidget(Assets.profileIcons.key, "Change Password",
                    Icons.arrow_forward_ios),
                const SizedBox(
                  height: 30,
                ),
                TextWidget(
                  title: "General",
                  color: Theme.of(context).primaryColor,
                  weight: FontWeight.bold,
                ),
                 ListTileWidget(Assets.profileIcons.orders, "Orders",
                    Icons.arrow_forward_ios),
                 ListTileWidget(Assets.profileIcons.favorite, "Favorites",
                    Icons.arrow_forward_ios),
                 ListTileWidget(Assets.profileIcons.location,
                    "My Addresses", Icons.arrow_forward_ios),
                 ListTileWidget(Assets.profileIcons.cards, "My Cards",
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
                    Assets.profileIcons.notification, "Notifications"),
                 ToggleButton(Assets.profileIcons.mode, "Dark Mode"),
                ListTile(
                  leading: SvgPicture.asset(Assets.profileIcons.language),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: 'Language',
                        color: Theme.of(context).secondaryHeaderColor,
                        font: 18,
                      ),
                      Row(children: const [
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
                  onTap: () {
                    authService.signOut();
                  },
                  leading: SvgPicture.asset(Assets.profileIcons.logout),
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
