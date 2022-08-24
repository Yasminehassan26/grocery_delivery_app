import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/services/authentication_service.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../services/user_favorites.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_button_widget.dart';
import 'input_widget.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  LoginBody({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    final favorites = Provider.of<UserFavorites>(context);

    // List<Category> data = DataFromJson(json.encode(jsonn));

    // Future addProducts() async {
    //   CollectionReference addCat =
    //       FirebaseFirestore.instance.collection('categories');

    //   data.forEach((element) async {
    //     var result = await addCat.add({
    //       'name': element.name,
    //       "image": element.image,
    //       'items': element.items.map(
    //         (item) {
    //           return {
    //             "id": item.id,
    //             "name": item.name,
    //             "weight": item.weight,
    //             "price": item.price,
    //             "image": item.image,
    //             "description": item.description,
    //           };
    //         },
    //       ).toList(),
    //     });
    //   });
    // }

    void _login() async {
      var res =
          await authService.signIn(emailController.text, passController.text);
      if (res) {
        favorites.favorites(authService.userId);
      }
      // await addProducts();
    }

    return Column(children: [
      Form(
        key: _key,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputWidget(emailController, 'Email', 'Email cannot be empty'),
              InputWidget(
                  passController, 'Password', 'Password cannot be empty'),
              ButtonWidget('Forgot Password?'),
            ]),
      ),
      ElevatedButtonWidget('Login', _login),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(title: 'Don\'t have any account?'),
          TextButton(
            child: TextWidget(
              title: 'Create one',
              font: 20,
              color: Colors.green,
            ),
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        ],
      ),
    ]);
  }
}
