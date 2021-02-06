import "package:flutter/material.dart";
import 'package:flutter_application_1/pages/single_chat_screen.dart';
import '../models/chat_model.dart';
import 'package:badges/badges.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() {
    return new _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SingleChatScreen(),
            ),
          ),
        },
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: new ClipOval(
                child: Image.network(
                  dummyData[i].avatarUrl,
                  width: 55,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    dummyData[i].name,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    dummyData[i].time,
                    style: new TextStyle(
                      color: dummyData[i].isNew != "true"
                          ? Colors.grey
                          : Theme.of(context).accentColor,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          dummyData[i].message,
                          style: new TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        dummyData[i].isNew == "true"
                            ? new Badge(
                                badgeColor: Theme.of(context).accentColor,
                                badgeContent: Text(
                                  '1',
                                  style: new TextStyle(color: Colors.white),
                                ),
                              )
                            : new Container(),
                      ],
                    ),
                    new Divider(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
