import "package:flutter/material.dart";

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Calls", style: new TextStyle(fontSize: 20.0)),
    );
  }
}
