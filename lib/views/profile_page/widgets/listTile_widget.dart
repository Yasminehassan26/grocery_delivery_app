import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final IconData trailingIcon;
  final String leadingIcon;
  final String title;

   ListTileWidget(this.leadingIcon, this.title, this.trailingIcon, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        leadingIcon,
      ),
      title: TextWidget(
        title: title,
        color: Colors.grey,
        font: 18,
      ),
      trailing: Icon(
        trailingIcon,
        color: Colors.grey,
      ),
    );
  }
}
