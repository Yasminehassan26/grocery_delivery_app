import 'dart:async';
import 'package:flutter/material.dart';

import 'package:grocery_delivery_app/views/login_register_pages/Wrapper_page.dart';

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
        padding: const EdgeInsets.only(
            top: 200.0, left: 0.0, right: 0.0, bottom: 0.0),
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
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ), //DecorationImage
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 8,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 232, 232, 232),
                        offset: Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Color.fromARGB(255, 212, 212, 212),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
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
