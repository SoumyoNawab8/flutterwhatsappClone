import "package:flutter/material.dart";
import 'package:flutter_application_1/components/status_tile.dart';
import 'package:flutter_application_1/MODELS/status_model.dart';
import 'package:flutter_application_1/pages/status_view_screen.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new StatusTile(
          primaryText: "My Status",
          subText: "tap to add status update",
          hideBottomBorder: true,
          selfUser: true,
          image:
              "https://images.unsplash.com/photo-1612462767092-1246df528494?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
        ),
        new Container(
          color: Colors.grey[300],
          width: width,
          child: Padding(
            child: new Text(
              'Recent updates',
              style: TextStyle(
                  color: Colors.grey[900], fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.fromLTRB(15.0, 11.0, 11.0, 11.0),
          ),
        ),
        new Container(
          height: 300.0,
          child: StatusList(
              context,
              (status_data) => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MoreStories(
                                files: status_data.files,
                                name: status_data.name,
                                time: status_data.time,
                              )),
                    )
                  }),
        ),
      ],
    );
  }
}

StatusList(BuildContext context, Function onTap) {
  return new ListView.builder(
    primary: false,
    itemCount: dummyStatus.length,
    itemBuilder: (context, indx) => new InkWell(
      onTap: () => {
        onTap(dummyStatus[indx]),
      },
      child: new StatusTile(
        primaryText: dummyStatus[indx].name,
        subText: dummyStatus[indx]
            .files[dummyStatus[indx].files.length > 0
                ? dummyStatus[indx].files.length - 1
                : dummyStatus[indx].files.length]
            .dateTime,
        image: dummyStatus[indx].files[0].fileUrl,
        filesArray: dummyStatus[indx].files,
      ),
    ),
  );
}
