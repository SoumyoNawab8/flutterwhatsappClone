import "package:flutter/material.dart";
import 'package:bubble/bubble.dart';
import 'package:flutter_application_1/models/chat_messages.model.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class SingleChatScreen extends StatefulWidget {
  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  TextEditingController _textMessageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Row(
            children: <Widget>[
              new InkWell(
                onTap: () => {
                  Navigator.pop(context),
                },
                child: new Row(
                  children: [
                    Icon(Icons.arrow_back),
                    new ClipOval(
                      child: Image.network(
                        "https://img.sharetv.com/shows/characters/large/young_sheldon.george_cooper_sr.jpg",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              new InkWell(
                onTap: () => {print("hello")},
                child: new Text("Mr. Cooper"),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            Icon(Icons.videocam),
            SizedBox(
              width: 23,
            ),
            Icon(Icons.call),
            SizedBox(
              width: 23,
            ),
            Icon(Icons.more_vert),
          ]),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/originals/79/5c/ab/795cabc4647f73b365e2e6eabd0f34dc.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(children: <Widget>[
          new Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: dummyChat.length,
              itemBuilder: (_, index) {
                final message = dummyChat[index];

                if (message.sender == "me")
                  return _messageLayout(
                      color: HexColor('#E1FEC6'),
                      time: message.time,
                      align: TextAlign.left,
                      boxAlign: CrossAxisAlignment.start,
                      crossAlign: CrossAxisAlignment.end,
                      nip: BubbleNip.rightTop,
                      text: message.message,
                      seenStatus: message.deliveryStatus == "sent"
                          ? Icon(Icons.done, color: Colors.grey, size: 15.0)
                          : Icon(Icons.done_all,
                              color: message.deliveryStatus == "seen"
                                  ? Colors.blue
                                  : Colors.grey,
                              size: 15.0));
                else
                  return _messageLayout(
                    color: Colors.white,
                    time: message.time,
                    align: TextAlign.left,
                    boxAlign: CrossAxisAlignment.start,
                    crossAlign: CrossAxisAlignment.start,
                    nip: BubbleNip.leftTop,
                    text: message.message,
                  );
              },
            ),
          ),
          _sendMessageTextField(),
        ]),
      ),
    );
  }

  Widget _messageLayout(
      {text, time, color, align, boxAlign, nip, crossAlign, seenStatus}) {
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.90,
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(3),
            child: Bubble(
              color: color,
              nip: nip,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      textAlign: align,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  seenStatus != null
                      ? Row(
                          children: [
                            Text(
                              time,
                              textAlign: align,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(
                                  .4,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            seenStatus
                          ],
                        )
                      : Text(
                          time,
                          textAlign: align,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(
                              .4,
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _sendMessageTextField() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0.0, 0.50),
                        spreadRadius: 1,
                        blurRadius: 1),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.insert_emoticon,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 60,
                      ),
                      child: Scrollbar(
                        child: TextField(
                          maxLines: null,
                          style: TextStyle(fontSize: 14),
                          controller: _textMessageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Transform.rotate(
                        angle: 99.7,
                        child: IconButton(
                          icon: Icon(
                            Icons.attach_file,
                            color: Colors.grey,
                          ),
                          onPressed: null,
                        ),
                      ),
                      // Icon(Icons.attach_file, color: Colors.grey[500]),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      _textMessageController.text.isEmpty
                          ? Icon(Icons.camera_alt, color: Colors.grey)
                          : Text(""),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              if (_textMessageController.text.isNotEmpty) {
                print("Hi dd");
              }
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Icon(
                  _textMessageController.text.isEmpty ? Icons.mic : Icons.send,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
