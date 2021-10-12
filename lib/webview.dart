import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class webview extends StatefulWidget{
  final String url;
  const webview(this.url);
  @override
  _webviewState createState() => _webviewState();
}
class _webviewState extends State<webview>{
  Widget build(BuildContext context){
    return WebView(
      initialUrl: widget.url,
    );
  }
}