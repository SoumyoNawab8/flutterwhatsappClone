import "package:flutter/material.dart";
import 'package:badges/badges.dart';
import 'package:fdottedline/fdottedline.dart';

class StatusTile extends StatelessWidget {
  StatusTile({
    @required this.primaryText,
    @required this.subText,
    @required this.image,
    this.selfUser,
    this.hideBottomBorder,
    this.filesArray,
  });

  final primaryText;
  final subText;
  final image;
  final selfUser;
  final hideBottomBorder;
  final filesArray;

  @override
  Widget build(BuildContext context) {
    var dataLength;
    if (this.filesArray != null) {
      if (this.filesArray.length == 1) {
        dataLength = 100.0;
      } else if (this.filesArray.length == 2) {
        dataLength = 80.0;
      } else if (this.filesArray.length == 3) {
        dataLength = 50.0;
      } else if (this.filesArray.length == 4) {
        dataLength = 40.0;
      } else if (this.filesArray.length == 5) {
        dataLength = 30.0;
      }
    }
    return ListTile(
      leading: selfUser == true
          ? Badge(
              padding: EdgeInsets.all(0),
              badgeColor: Theme.of(context).accentColor,
              position: BadgePosition(bottom: 0, end: 0),
              badgeContent: Icon(
                Icons.add,
                size: 22,
                color: Colors.white,
              ),
              child: new ClipOval(
                child: Image.network(
                  image,
                  width: 55,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : dataLength != null
              ? new FDottedLine(
                  color: Theme.of(context).indicatorColor,
                  height: 75.0,
                  width: 75.0,
                  strokeWidth: 3.0,
                  dottedLength: dataLength,
                  space: this.filesArray != null
                      ? this.filesArray.length == 1
                          ? 0.0
                          : 4.0
                      : 4.0,

                  /// Set corner
                  corner: FDottedLineCorner.all(75),
                  child: Container(
                    margin: EdgeInsets.all(3.0),
                    child: new ClipOval(
                      child: Image.network(
                        image,
                        width: 51,
                        height: 66,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : new ClipOval(
                  child: Image.network(
                    image,
                    width: 55,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            primaryText,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
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
                  subText,
                  style: new TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            hideBottomBorder == false
                ? new Divider(
                    height: 10.0,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
