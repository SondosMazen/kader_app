import 'package:flutter/material.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/main.dart';
import 'package:kader_app/prefs/user_perferences.dart';
import 'package:kader_app/utlies/app_colors.dart';
import 'package:kader_app/utlies/size_config.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var _lang = ['العربية', 'English'];
  var _currentItemSelected = 'English';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
             child: Column(

               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 Center(
                   child: Container(
                     width: SizeConfig.scaleWidth(90),
                     height: SizeConfig.scaleHeight(90),
                     color: AppColors.MAIN_COLOR,
                     child: Image(image: AssetImage('images/logo.png'),

                       // radius: SizeConfig.scaleHeight(48),
                     ),
                   ),
                 ),
            //      CircleAvatar(
            //       radius: SizeConfig.scaleHeight(48),
            //       backgroundImage: AssetImage("images/logo.png"),
            //       backgroundColor: AppColors.MAIN_COLOR,
            // ),
                 SizedBox(
                   width: SizeConfig.scaleWidth(20),
                 ),
                 Text(
                   AppLocalizations.of(context).translate("Kader"),
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: SizeConfig.scaleTextFont(25),
                     color: AppColors.MAIN_COLOR,
                   ),
                 ),

               ],
             ),

            decoration: BoxDecoration(
              color: AppColors.MAIN_COLOR,
            ),
            // accountEmail: Text(
            //   AppLocalizations.of(context).translate("StaffOfThePalestinianMinistryOfHealth"),
            //   style: TextStyle(
            //     fontWeight: FontWeight.w700,
            //     fontSize: 15,
            //     color: AppColors.MAIN_COLOR,
            //   ),
            // ),
          ),
          ExpansionTile(
              leading: Icon(
                Icons.language,
                color: Colors.black,
              ),
              title: Text(
                AppLocalizations.of(context).translate("Language"),style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.scaleTextFont(20),
                color: Colors.black,
              ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              children: [
                GestureDetector(
                  child: Text(
                    AppLocalizations.of(context).translate("Arabic"),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.scaleTextFont(18),
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    MainApp.setLocale(context, Locale("en"));
                    UserPreferences.instance.changeLanguage(("ar"));
                    MainApp.setLocale(context, Locale("ar"));
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Text(
                    AppLocalizations.of(context).translate("English"),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.scaleTextFont(18),
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    MainApp.setLocale(context, Locale("en"));
                    UserPreferences.instance.changeLanguage(("en"));
                    MainApp.setLocale(context, Locale("en"));
                    Navigator.pop(context);
                  },
                ),
              ]),
          ListTile(
            onTap: () {
              // _closeEndDrawer();
            },
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text(
              AppLocalizations.of(context).translate("Logout"),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.scaleTextFont(20),
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ],
      ),

    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
