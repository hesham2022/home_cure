import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:home_cure/app/app.dart';

class WebViewPaymentPage extends StatefulWidget {
  WebViewPaymentPage({
    super.key,
    required this.title,
    required this.url,
    this.isPayment = false,
    required this.callbackPayment,
  });
  final String title;

  final String url;

  final ValueChanged<String> callbackPayment;
  bool isPayment;

  @override
  _WebViewPaymentPageState createState() => _WebViewPaymentPageState();
}

class _WebViewPaymentPageState extends State<WebViewPaymentPage> {
  late FlutterWebviewPlugin flutterWebviewPlugin;
  num position = 1;
  final key = UniqueKey();

  void doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  void startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  void initState() {
    flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print(' url $url');

      if (url.contains('&success=false&') || url.contains('&success=true&')) {
        Navigator.of(context).pop();
        flutterWebviewPlugin.close();
        widget.callbackPayment.call(url);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPageBack,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            widget.title,
          ),
          backgroundColor: primaryColor,
        ),
        body: WebviewScaffold(
          url: widget.url,
          key: key,
          debuggingEnabled: true,
          initialChild: Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onPageBack() async {
    return Future.value(true);
  }
}
