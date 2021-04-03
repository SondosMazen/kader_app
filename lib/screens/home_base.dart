import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/custom_widgets/app_bar_screen.dart';
import 'package:kader_app/custom_widgets/app_drawer.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/main.dart';
import 'package:kader_app/screens/home_screen.dart';
import 'package:kader_app/utlies/size_config.dart';

void main() => runApp(MainApp());

class HomeBaseScreen extends StatefulWidget {

  static void changeBaseWidget(BuildContext context, Widget widget, String title){
    _HomeBaseScreenState state = context.findAncestorStateOfType<_HomeBaseScreenState>();
    state.changeBaseWidget(widget,title);
  }
  @override
  _HomeBaseScreenState createState() => _HomeBaseScreenState();
}

class _HomeBaseScreenState extends State<HomeBaseScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   Widget _widget;
    String _texty = "";

  void changeBaseWidget(Widget widget,String title){
    setState(() {
      _widget = widget;
      _texty = title;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widget = HomeScreen();
    _texty = "Home";
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: DrawerScreen(),
      drawerEnableOpenDragGesture: true,
      appBar: AppBarScreen(
      //  text:  AppLocalizations.of(context).translate(_texty),
        text: AppLocalizations.of(context).translate(_texty)??"Home",
        openDrawer: (){
          // _scaffoldKey.currentState.openDrawer();
          openEndDrawer();
        },
      ),
      body: _widget,
    );
  }

  void openEndDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }
}
