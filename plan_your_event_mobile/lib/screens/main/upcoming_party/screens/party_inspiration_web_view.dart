import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/styling/colors.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';
import 'package:planyoureventmobile/styling/gradient_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PartyInspirationWebView extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<PartyInspirationWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: appColors['backgroud_color'],
        appBar: AppBar(
        centerTitle: true,
        title: Text(appStrings['inspiration']),
    flexibleSpace: getGradientBar,
    ),
    body: WebView(
      initialUrl: 'https://pin.it/6uEO9Yj',
        javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}