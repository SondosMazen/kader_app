import 'package:flutter/material.dart';
import 'package:kader_app/utlies/size_config.dart';

class AppStackHome extends StatelessWidget {
  final Image image;
  final String text;
  final Color color;
  final Function changeScreen;

  AppStackHome({
    this.image,
    this.text,
    this.color,
    this.changeScreen,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: changeScreen,
      child: Stack(
        children: [
          Container(
            width: SizeConfig.scaleWidth(95),
            height: SizeConfig.scaleHeight(95),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: SizeConfig.scaleHeight(25),
              ),
              child: SizedBox(
                  width: SizeConfig.scaleWidth(26),
                  height: SizeConfig.scaleHeight(26),
                  child: image),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.topCenter,
          ),
          PositionedDirectional(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                ),
                color: color,
              ),
              height: SizeConfig.scaleHeight(25),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: SizeConfig.scaleTextFont(14),
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              alignment: AlignmentDirectional.center,
            ),
            bottom: SizeConfig.scaleHeight(0),
            start: SizeConfig.scaleWidth(0),
            end: SizeConfig.scaleWidth(5),
          ),
        ],
      ),
    );
  }
}
