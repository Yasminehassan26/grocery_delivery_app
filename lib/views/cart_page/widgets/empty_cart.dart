import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../login_register_pages/wrapper_page.dart';
import '../../widgets/elevated_button_widget.dart';
import '../../widgets/text_widget.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(60),
              child: SvgPicture.asset(
                Assets.emptyCart,
                fit: BoxFit.fill,
              ),
            ),
            const TextWidget(
                title: "Your cart is empty",
                font: 24,
                weight: FontWeight.bold,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
              title: "Looks like you haven’t made",
              textAlign: TextAlign.center,
              font: 20,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            const SizedBox(
              height: 8,
            ),
            TextWidget(
                title: "your choice yet...",
                font: 20,
                color: Theme.of(context).secondaryHeaderColor,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            ElevatedButtonWidget(
                'Start Shopping',
                () => {
                      // Navigator.of(context)
                      //     .pushReplacementNamed(Wrapper.routeName)
                      Navigator.of(context).pop(),
                    }),
          ],
        ),
      ),
    );
  }
}
