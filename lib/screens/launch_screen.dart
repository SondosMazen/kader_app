import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/prefs/user_perferences.dart';
import 'package:kader_app/utlies/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}
/////xxxx
class _LaunchScreenState extends State<LaunchScreen> {
  SharedPreferences prefs;
  bool isLogged;

  Future<Null> getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    isLogged = prefs.getBool("isLogged")?? false;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserPreferences.instance;
    getSharedPrefs();
    Future.delayed(Duration(seconds: 3), () {
      if(isLogged) {
        Navigator.pushReplacementNamed(context, '/home_screen');
      }
      else{
        Navigator.pushReplacementNamed(context, '/login_webview_screen');
      }
    });
  }
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
               // width: SizeConfig.scaleWidth(164),
                //height: SizeConfig.scaleHeight(52),
                child:  Text(
                  AppLocalizations.of(context).translate("StaffOfThePalestinianMinistryOfHealth"),
                  //"?????????? ?????????? ?????????? ????????????????????"
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
