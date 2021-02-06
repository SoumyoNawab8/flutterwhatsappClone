import "package:flutter/material.dart";

class StatusModel {
  final String name;
  final String time;
  final List files;

  StatusModel({this.name, this.time, this.files});
}

List<StatusModel> dummyStatus = [
  new StatusModel(
    name: "Mr.Cooper",
    time: "9:00 am",
    files: [
      new FileModel(
        id: 1,
        fileUrl:
            "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/21/11/young-sheldon-main.jpg",
        type: "image",
        dateTime: "9:00 am",
        caption: "Our Family 😍",
      ),
    ],
  ),
  new StatusModel(
    name: "Missy Cooper",
    time: "9:35 am",
    files: [
      new FileModel(
        id: 1,
        fileUrl:
            "https://cheesecake.articleassets.meaww.com/388794/uploads/a9d36e60-0752-11ea-908d-47aa6af86bed_800_420.jpeg",
        type: "image",
        dateTime: "9:35 am",
        caption: "Ready to hit a strike😎",
      ),
    ],
  ),
  new StatusModel(
    name: "Richard hendricks",
    time: "6:12 am",
    files: [
      new FileModel(
          id: 1,
          fileUrl:
              "https://cdn.vox-cdn.com/thumbor/z0lTmUj76yX7qWUtVIJCEswYyvs=/0x148:2696x1945/1200x800/filters:focal(0x148:2696x1945)/cdn.vox-cdn.com/uploads/chorus_image/image/46076198/SV204_111314_FM015_cr__1_.0.0.jpg",
          type: "image",
          dateTime: "10:35 pm",
          caption: "Miss our team"),
      new FileModel(
          id: 2,
          fileUrl: "https://blog.codemagic.io/uploads/2020/01/dashmascot.jpg",
          type: "image",
          dateTime: "5:00 am",
          caption: "Need one of these 😵"),
      new FileModel(
        id: 3,
        title: "Anyways excited for Week 2 of #30DaysOfFlutter 🤩",
        type: "text",
        dateTime: "6:12 am",
        bg_colors: new Color(0xFF1FD2FF),
      ),
    ],
  ),
];

class FileModel {
  final int id;
  final String fileUrl;
  final String type;
  final String dateTime;
  final String caption;
  final String title;
  final Color bg_colors;

  FileModel({
    this.id,
    this.fileUrl,
    this.type,
    this.dateTime,
    this.caption,
    this.title,
    this.bg_colors,
  });
}
