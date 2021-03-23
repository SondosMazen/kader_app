import 'package:flutter/material.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class AppRowListView extends StatelessWidget {
  final String text;

  AppRowListView({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.scaleHeight(57),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [
      Container(
        height: SizeConfig.scaleHeight(57),
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(15),
        ),
        child: SizedBox(
            height: SizeConfig.scaleHeight(19),
            width: SizeConfig.scaleWidth(16),
            child: Image.asset("images/polygon_1.png"),
    ),
      ),
      SizedBox(
        width: SizeConfig.scaleWidth(11),
      ),
      Center(
        child: Text(text, style: TextStyle(
          fontSize: SizeConfig.scaleTextFont(14),
          color: AppColors.TEXT_LIST_COLOR,
          fontWeight: FontWeight.w500,
        ),),
      )
    ]
      ),
    );
  }
}