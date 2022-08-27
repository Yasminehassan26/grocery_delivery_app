import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../gen/assets.gen.dart';
import '../../login_register_pages/Wrapper_page.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/elevated_button_widget.dart';

class checkoutOrderPage extends StatelessWidget {
  static const routeName = '/checkout';

  checkoutOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffE5E5E5),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(40),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.checkout,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 12,
                ),
                const TextWidget(
                    title: "Your Order Has Been Accepted",
                    font: 24,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  title: "We’ve accepted your order, and we’re",
                  textAlign: TextAlign.center,
                  font: 18,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                    title: "getting it ready.",
                    font: 18,
                    color: Theme.of(context).secondaryHeaderColor,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButtonWidget('Track Order', () => {}),
                TextButton(
                  child: const TextWidget(
                    title: "Back Home",
                    weight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    font: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Wrapper.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
