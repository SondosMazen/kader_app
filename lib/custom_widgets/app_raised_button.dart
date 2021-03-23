import 'package:flutter/material.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';


class AppRaisedButton extends StatelessWidget {
final Icon icon;
final String text;
final Color color;

AppRaisedButton({
  this.text,
  this.color,
  this.icon,
});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: color,
      textColor: Colors.white,
      child: Container(
        width: SizeConfig.scaleHeight(106),
        height: SizeConfig.scaleWidth(106),
        padding: EdgeInsetsDirectional.zero,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: SizeConfig.scaleWidth(30),
              height: SizeConfig.scaleHeight(26.7),
              child: icon,

            ),
            Text(
            text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Tajawal',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
