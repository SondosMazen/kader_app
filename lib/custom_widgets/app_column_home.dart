import 'package:flutter/material.dart';
import 'package:kader_app/custom_widgets/app_raised_button.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';


class AppColumnHome extends StatelessWidget {

  final RaisedButton appraisedButton;
  final String text;
  final Color color;
  final Icon icon;
  AppColumnHome({
    this.text,
    this.color,
    this.icon,
    this.appraisedButton,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppRaisedButton(
        color: color,
      text: text,
      icon: icon,
    ),
        SizedBox(
          height: SizeConfig.scaleHeight(6),
        ),
        appraisedButton,
      ],
    );
  }
}
