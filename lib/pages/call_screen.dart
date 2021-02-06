import "package:flutter/material.dart";
import '../models/calls_models.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new InkWell(
        onTap: () => {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => SingleChatScreen(),
          //   ),
          // ),
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
                  dummyData[i].call_type == "video"
                      ? new Icon(Icons.videocam,
                          color: Theme.of(context).indicatorColor)
                      : new Icon(Icons.call,
                          color: Theme.of(context).indicatorColor)
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
                        new Row(
                          children: <Widget>[
                            dummyData[i].type != "outgoing"
                                ? new Icon(
                                    Icons.call_received,
                                    size: 15,
                                    color: dummyData[i].type == "incoming"
                                        ? Theme.of(context).indicatorColor
                                        : Colors.red,
                                  )
                                : new Icon(Icons.call_made,
                                    size: 15,
                                    color: Theme.of(context).indicatorColor),
                            new Text(
                              dummyData[i].time,
                              style: new TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        new Container(),
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
