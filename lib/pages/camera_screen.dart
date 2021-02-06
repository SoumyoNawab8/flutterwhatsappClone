import "package:flutter/material.dart";
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras, this.activeCamera);
  final int activeCamera;

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  var activeIndex;
  @override
  void initState() {
    super.initState();
    controller = new CameraController(
        widget.cameras[widget.activeCamera], ResolutionPreset.ultraHigh);
    activeIndex = 0;
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void switchCamera() {
    controller = new CameraController(
        widget.cameras[widget.activeCamera], ResolutionPreset.medium);
    activeIndex = widget.activeCamera;
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activeCamera != activeIndex) {
      switchCamera();
    }
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: new CameraPreview(controller),
    );
  }
}
