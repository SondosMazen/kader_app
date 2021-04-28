
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

import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kader_app/models/message.dart';
import 'package:kader_app/models/message_list.dart';
import 'package:kader_app/models/permissions.dart';
import 'package:kader_app/models/token_monitor.dart';


/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

//hi
/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );


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
  String _token;

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
      String languageCode = value.getString("language") ?? "ar";
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

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.pushNamed(context, '/message',
            arguments: MessageArguments(message, true));
      }
    });



    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
      print('message:${message.messageId}');
      print('message:${message.data.toString()}');
    });

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
    // title:'First app',
    // home: Scaffold(
    // appBar: AppBar(
    // title: Text('app'),
    // ),
    // body : Center(
    //
    // child:  TokenMonitor((token) {
    //   _token = token;
    //   return token == null
    //       ? const CircularProgressIndicator()
    //       : Text(token, style: const TextStyle(fontSize: 12));
    // })
    // ),
    // ),
    );
  }
}
