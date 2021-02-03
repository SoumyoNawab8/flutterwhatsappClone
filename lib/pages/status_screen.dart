import "package:flutter/material.dart";

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Status", style: new TextStyle(fontSize: 20.0)),
    );
  }
}
