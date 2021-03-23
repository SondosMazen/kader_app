import 'package:flutter/material.dart';
import 'package:kader_app/screens/home_base.dart';
import 'package:kader_app/screens/home_screen.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String text;
  final Function openDrawer;

  AppBarScreen({this.text, this.openDrawer});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      key: _scaffoldKey,
      backgroundColor: AppColors.MAIN_COLOR,
      shadowColor: Color(0XFF4d0000),
      leading: Builder(
        builder: (BuildContext context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: openDrawer,
                ),
              ),
              SizedBox(
                width: SizeConfig.scaleWidth(15),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.add_alert),
                  onPressed: () {},
                ),
              ),
            ],
          );
        },
      ),
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.scaleTextFont(20),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
             Navigator.pushReplacementNamed(context, '/home_screen');
            // Navigator.pop(context, true);


            // Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
