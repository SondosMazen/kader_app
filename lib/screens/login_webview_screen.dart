import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kader_app/models/SSO_Info.dart';
import 'package:kader_app/models/SSO_Token.dart';
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

      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        SSO_Info sso_info =  SSO_Info.fromJson(jsonDecode(response.body));
        print(sso_info.status);
        if(sso_info.status =="success"){
          Navigator.pushReplacementNamed(context, '/home_screen');
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
