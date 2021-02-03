import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/call_screen.dart';
import 'package:flutter_application_1/pages/camera_screen.dart';
import 'package:flutter_application_1/pages/chat_screen.dart';
import 'package:flutter_application_1/pages/status_screen.dart';
import 'package:badges/badges.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width / 5;
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
                child: new Text(
                  "STATUS",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: yourWidth,
              child: new Tab(
                child: new Text(
                  "CHATS",
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
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
