import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/prefs/user_perferences.dart';
import 'package:kader_app/utlies/size_config.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserPreferences.instance;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home_screen');
    });
  }
//launch
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/launch.png"), fit: BoxFit.cover),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: SizeConfig.scaleWidth(164),
                  height: SizeConfig.scaleHeight(176),
                  child: Image(image: AssetImage('images/logo.png'),),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(33),
              ),
              Container(
                width: SizeConfig.scaleWidth(164),
                height: SizeConfig.scaleHeight(52),
                child:  Text(
                  "موظقي وزارة الصحة الفلسطينية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: SizeConfig.scaleTextFont(19),
                    fontWeight: FontWeight.w500,
                  ),

              ),
              ),
            ]),
      ),

    );
  }
}
