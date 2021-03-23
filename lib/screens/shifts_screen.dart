import 'package:flutter/material.dart';
import 'package:kader_app/custom_widgets/app_bar_screen.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class ShiftsScreen extends StatefulWidget {
  @override
  _ShiftsScreenState createState() => _ShiftsScreenState();
}

class _ShiftsScreenState extends State<ShiftsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(16),
          end: SizeConfig.scaleWidth(16),
          top: SizeConfig.scaleHeight(18),
          // bottom: SizeConfig.scaleHeight(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.DOTS_HORIZANTAL_COLOR,
        ),

      ),
    );
  }
}
