import "package:flutter/material.dart";

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Camera", style: new TextStyle(fontSize: 20.0)),
    );
  }
}
