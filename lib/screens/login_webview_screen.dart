import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kader_app/api/api_settings.dart';
import 'package:kader_app/models/SSO_Info.dart';
import 'package:kader_app/models/SSO_Token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class LoginWebViewScreen extends StatefulWidget {
  @override
  _LoginWebViewScreenState createState() => _LoginWebViewScreenState();
}

class _LoginWebViewScreenState extends State<LoginWebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String client_id = "KADER_APP_MOH" ;
  String client_secret= "_432f10daa373752fc6241adfe952fb8acb5235abcf";

  String _fcm_token;
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("تسجيل الدخول الموحد SSO")),
      ),
      body: WebView(
        initialUrl:
            'https://ssoidp.gov.ps/sso/module.php/sspoauth2/mobile_authorize.php?client_id='+client_id,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
        navigationDelegate: (NavigationRequest request)
        {
          List<String> split = request.url.split("code=");
          print(split[1]);
          generate_token(split[1]);
          // if (request.url.startsWith('https://my.redirect.url.com'))
          // {
          //   print('blocking navigation to $request}');
          //   _launchURL('https://my.redirect.url.com');
          //   return NavigationDecision.prevent;
          // }

          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    );
  }
  //////////////////////////////
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }}
    ///////////////////////////////////////////
  Future<void> generate_token(String code) async {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("Sending Message"),
    // ));

    prefs = await SharedPreferences.getInstance();

    showLoaderDialog(context);

    final response = await http.post(
      Uri.parse('https://ssoidp.gov.ps/sso/module.php/sspoauth2/token.php'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: //jsonEncode(
          <String, String>{
        'code': code,
        'client_id': client_id,
        'client_secret': client_secret,
      },//),
    );

    print("hello"+response.body);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      SSO_Token sso_token =  SSO_Token.fromJson(jsonDecode(response.body));
      prefs.setString('token', sso_token.accessToken);
      // UserPreferences.instance.saveToken(sso_token.accessToken);
      print(sso_token.accessToken);

      final verify_response = await http.post(
        Uri.parse('https://ssoidp.gov.ps/sso/module.php/sspoauth2/verify.php'),
        headers: <String, String>{
          'x-sso-authorization': sso_token.accessToken,
        },
        // body: //jsonEncode(
        // <String, String>{
        //   'code': code,
        //   'client_id': client_id,
        //   'client_secret': client_secret,
        // },//),
      );

      print("hello"+verify_response.body);

      if (verify_response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        SSO_Info sso_info =  SSO_Info.fromJson(jsonDecode(verify_response.body));
        print(sso_info.status);

        if(sso_info.status =="success"){

          prefs.setBool("isLogged", true);
          prefs.setString("user_id", sso_info.userId);
          prefs.setString("account_type", sso_info.accountType);
          prefs.setString("name", sso_info.name);
          prefs.setString("mobile", sso_info.mobile);
          prefs.setString("ministry_cd", sso_info.ministryCd);
          prefs.setString("sso_info", verify_response.body);


          // UserPreferences.instance.save_sso_info(verify_response.body);
          // UserPreferences.instance.save_user(sso_info);

          FirebaseMessaging.instance.getToken().then(setFcmToken);
          Stream<String> _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
          _tokenStream.listen(setFcmToken);


            // print(prefs.getString('fcm_token') ?? '');
            // print(prefs.getString('ministry_cd') ?? '');




        }
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to verify');
      }



    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
  }
  ///////////////////////////////////////////
  void setFcmToken(String token) {
    print('FCM Token: $token');
    setState(() {
      _fcm_token = token;
    });

    prefs.setString("fcm_token", _fcm_token);
    insert_login(_fcm_token);
  }
  //////////////////////////////////////////////
  Future<void> insert_login(String token) async {
    https://apps.moh.gov.ps/kader/index.php/UsersAPI/INSERT_USERS_AUTHENTICATION
    http://apps.moh.gov.ps/kader/index.php/UsersAPI/INSERT_USERS_AUTHENTICATION
    print("hello" + ApiSettings.AUTH_Login);
    final insert_response = await http.post(
      Uri.parse(ApiSettings.AUTH_Login),
      headers: <String, String>{
        'P-ID': prefs.getString('user_id') ?? '',
        'P-TOKEN': prefs.getString('token') ?? '',
        'FCM-TOKEN': _fcm_token,
      },
      // body: //jsonEncode(
      // <String, String>{
      //   'code': code,
      //   'client_id': client_id,
      //   'client_secret': client_secret,
      // },//),
    );

    print("hello" + insert_response.body);
    Navigator.pushReplacementNamed(context, '/home_screen');

    if (insert_response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/home_screen');
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // SSO_Token sso_token = SSO_Token.fromJson(jsonDecode(response.body));
      // UserPreferences.instance.saveToken(sso_token.accessToken);
      // print(sso_token.accessToken);
    }
  }

  ///////////////////////////////////////////
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7, right: 7),child:Text("جاري تسجيل الدخول .." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
