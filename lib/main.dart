
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kader_app/locale/AppLocalizations.dart';
import 'package:kader_app/screens/additional_services%20_screen.dart';
import 'package:kader_app/screens/administrative_services_screen.dart';
import 'package:kader_app/screens/custody_screen.dart';
import 'package:kader_app/screens/details_of_the_news_screen.dart';
import 'package:kader_app/screens/home_base.dart';
import 'package:kader_app/screens/launch_screen.dart';
import 'package:kader_app/screens/login_screen.dart';
import 'package:kader_app/screens/news_screen.dart';
import 'package:kader_app/screens/permanence_screen.dart';
import 'package:kader_app/screens/pop_up_menu.dart';
import 'package:kader_app/screens/protocols_screen.dart';
import 'package:kader_app/screens/share.dart';
import 'package:kader_app/screens/shifts_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // UserPreferences.instance;
  runApp(MainApp());
}
class MainApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale){
    _MainAppState state = context.findAncestorStateOfType<_MainAppState>();
    state.setLocale(newLocale);
  }
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale;
  SharedPreferences _sharedPreferences;
  setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    SharedPreferences.getInstance().then((value) {
      String languageCode = value.getString("language") ?? "en";
      setLocale(Locale(languageCode));
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // String languageCode = UserPreferences.instance.isRTL() ? "ar" : "en";
    // _locale = Locale(languageCode);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale("en" , "US"),
        Locale("ar" , "SA"),
      ],
      localizationsDelegates:[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // home: LaunchScreen(),
      initialRoute: '/launch_screen',
      routes: {
        //'/screen_name': Widget Function(BuildContext context);
        '/launch_screen': (context) => LaunchScreen(),
        '/home_screen': (context) => HomeBaseScreen(),
        '/administrative_services_screen': (context) => AdministrativeServicesScreen(),
        '/protocols_screen': (context) => ProtocolsScreen(),
        '/details_of_the_news_screen': (context) => DetailsNewsScreen(),
        '/additional_services _screen': (context) => AdditionalServicesScreen(),
        '/custody_screen': (context) => CustodyScreen(),
        '/permanence_screen': (context) => PermanencsScreen(),
        '/shifts_screen': (context) => ShiftsScreen(),
        '/news_screen': (context) => NewsScreen(),
        '/PopUpMenu': (context) => PopUpMenu(),
        '/DemoApp': (context) => DemoApp(),
        '/login_screen': (Context) => LoginScreen(),

      },
    );
  }
}
