import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HelpScreen extends StatefulWidget {
  @override
  HelpScreenState createState() {
    return HelpScreenState();
  }
}

class HelpScreenState extends State<HelpScreen> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    _loadHtmlFromAssets();
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/images/help.html');
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}