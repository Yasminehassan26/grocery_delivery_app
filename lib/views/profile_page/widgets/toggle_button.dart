// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../widgets/text_widget.dart';

class ToggleButton extends StatefulWidget {
  final String title;

  final String path;

  const ToggleButton(this.path, this.title, {Key? key}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState(path, title);
}

class _ToggleButtonState extends State<ToggleButton> {
  bool state = true;
  final String title;

  final String path;
  _ToggleButtonState(this.path, this.title);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(path),
      title: TextWidget(
        title: title,
        color: Colors.grey,
        font: 18,
      ),
      trailing: SizedBox(
        width: 70,
        child: FlutterSwitch(
          activeColor: Colors.green,
          value: state,
          padding: 5,
          onToggle: (value) {
            setState(() {
              state = value;
            });
          },
        ),
      ),
    );
  }
}
