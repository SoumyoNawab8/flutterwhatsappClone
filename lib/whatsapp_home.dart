import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/call_screen.dart';
import 'package:flutter_application_1/pages/camera_screen.dart';
import 'package:flutter_application_1/pages/chat_screen.dart';
import 'package:flutter_application_1/pages/status_screen.dart';
import 'package:badges/badges.dart';
import 'package:camera/camera.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _activeTabIndex;
  var activeCameraIndex;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _activeTabIndex = 1;
    activeCameraIndex = 0;
  }

  void switchCamera() {
    print("hitting");
    setState(() {
      if (activeCameraIndex == 0) {
        activeCameraIndex = 1;
      } else {
        activeCameraIndex = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width / 5;
    void _setActiveTabIndex() {
      setState(() {
        _activeTabIndex = _tabController.index;
      });
    }

    _tabController.addListener(_setActiveTabIndex);
    return Scaffold(
        appBar: new AppBar(
          title: new Text("WhatsApp"),
          elevation: 0.7,
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: <Widget>[
              Container(
                width: 20.0,
                alignment: Alignment.center,
                child: new Tab(
                  icon: new Icon(Icons.camera_alt),
                ),
              ),
              Container(
                width: yourWidth,
                child: new Tab(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "CHATS",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Badge(
                        badgeColor: Colors.white,
                        position: BadgePosition.bottomEnd(end: -20),
                        badgeContent: Text(
                          '1',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: yourWidth,
                child: new Tab(
                  child: new Badge(
                    badgeColor: Colors.white,
                    padding: _activeTabIndex != 2
                        ? EdgeInsets.all(3)
                        : EdgeInsets.all(0),
                    position: BadgePosition(top: 6, end: -11),
                    child: new Text(
                      "STATUS",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: yourWidth,
                child: new Tab(
                  child: new Text(
                    "CALLS",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            new Icon(Icons.search),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
            new Icon(Icons.more_vert)
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CameraScreen(widget.cameras, activeCameraIndex),
            new ChatScreen(),
            new StatusScreen(),
            new CallScreen(),
          ],
        ),
        floatingActionButton:
            showFloatButton(context, _activeTabIndex, switchCamera));
  }

  showFloatButton(
      BuildContext context, var _activeTabIndex, Function switchCamera) {
    if (_activeTabIndex == null || _activeTabIndex == 1) {
      return chatScreenFloatingButton(context);
    } else if (_activeTabIndex == 2) {
      return statusScreenFloatingButton(context);
    } else if (_activeTabIndex == 3) {
      return callsScreenFloatingButton(context);
    } else {
      return cameraScreenFloatingButton(context, switchCamera);
    }
  }

  callsScreenFloatingButton(BuildContext context) {
    return new FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      child: new Icon(
        Icons.add_ic_call,
        color: Colors.white,
      ),
      onPressed: () => {print("hello")},
    );
  }

  cameraScreenFloatingButton(BuildContext context, Function switchCamera) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton(
          elevation: 3.7,
          heroTag: null,
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.camera,
            color: Colors.white,
          ),
          onPressed: () => {print("hello")},
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        FloatingActionButton(
          heroTag: null,
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.switch_camera,
            color: Colors.white,
          ),
          onPressed: () => {switchCamera()},
        ),
      ],
    );
  }

  statusScreenFloatingButton(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton(
          elevation: 3.7,
          heroTag: null,
          mini: true,
          backgroundColor: Color(0xB3FFFFFF),
          child: new Icon(
            Icons.edit,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => {print("hello")},
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        FloatingActionButton(
          heroTag: null,
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(
            Icons.photo_camera,
            color: Colors.white,
          ),
          onPressed: () => {print("hello")},
        ),
      ],
    );
  }

  chatScreenFloatingButton(BuildContext context) {
    return new FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      child: new Icon(
        Icons.message,
        color: Colors.white,
      ),
      onPressed: () => {print("hello")},
    );
  }
}
