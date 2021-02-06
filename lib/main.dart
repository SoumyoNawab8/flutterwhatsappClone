import 'package:flutter/material.dart';
import 'package:flutter_application_1/whatsapp_home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
        indicatorColor: new Color(0xFF107A6E),
      ),
      debugShowCheckedModeBanner: false,
      home: new WhatsAppHome(),
    );
  }
}
