import 'dart:async';
import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';

import 'login_register_pages/wrapper_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Wrapper())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  //BoxDecoration Widget
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.logoo.path),
                      fit: BoxFit.cover,
                    ), //DecorationImage
                  ), //BoxDecoration
                ), //Container
                const SizedBox(
                  width: 10,
                  height: 15,
                ),
                const Text(
                  "Carrot",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(83, 79, 112, 1.000),
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const Text(
                  "Your Grocery Market",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(83, 79, 112, 1.000),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 255, 129, 80)),
            ),
          ],
        ),
      ),
    );
  }
}
