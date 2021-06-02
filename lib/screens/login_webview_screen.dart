import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebViewScreen extends StatefulWidget {
  @override
  _LoginWebViewScreenState createState() => _LoginWebViewScreenState();
}

class _LoginWebViewScreenState extends State<LoginWebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("webview login")),
      ),
      body: WebView(
        initialUrl:
            'https://ssoidp.gov.ps/sso/module.php/sspoauth2/mobile_authorize.php?client_id=KADER_APP_MOH',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}