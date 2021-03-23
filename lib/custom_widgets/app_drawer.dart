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
            //  UserAccountsDrawerHeader(
            // currentAccountPicture: CircleAvatar(
            //   radius: SizeConfig.scaleHeight(60),
            //   backgroundImage: AssetImage("images/logo.png"),
            //   backgroundColor: Colors.white,
            // ),
            // accountName:
            // Text(
            //   "كادر", style: TextStyle(
            //   fontWeight: FontWeight.w600,
            //   fontSize: 40,
            //   color: Colors.white,
            // ),
            // ),
            decoration: BoxDecoration(
              color: AppColors.MAIN_COLOR,
            ),
          ),
          ListTile(
            onTap: () {
              // DropdownButton<String>(
              //   items: _lang.map((String dropDownStringItem) {
              //     return DropdownMenuItem<String>(
              //       value: dropDownStringItem,
              //       child: Text(dropDownStringItem),
              //     );
              //   }).toList(),
              //   onChanged: (String newValueSelected) {
              //     _onDropDownItemSelected(newValueSelected);
              //
              //   },
              //   value:  _currentItemSelected,
              // );
              MainApp.setLocale(context, Locale("en"));
              if (UserPreferences.instance.isRTL()) {
                UserPreferences.instance.changeLanguage(("en"));
                MainApp.setLocale(context, Locale("en"));
              } else {
                UserPreferences.instance.changeLanguage(("ar"));
                MainApp.setLocale(context, Locale("ar"));
              }
              // _closeEndDrawer();
            },
            leading: Icon(
              Icons.language,
              color: Colors.black,
            ),
            title: Text(
              AppLocalizations.of(context).translate("Language"),
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
 void _onDropDownItemSelected(String newValueSelected){
   setState((){
     this._currentItemSelected = newValueSelected;
   });
 }
}
