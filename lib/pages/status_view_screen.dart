import "package:flutter/material.dart";
import 'package:story_view/story_view.dart';

class MoreStories extends StatelessWidget {
  MoreStories({this.files, this.name, this.time});

  final storyController = StoryController();
  final files;
  final name;
  final time;

  @override
  void dispose() {
    storyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<StoryItem> story_items = [];
    files.forEach((file) => {
          if (file.type == "image")
            {
              story_items.insert(
                  story_items.length > 0
                      ? story_items.length - 1
                      : story_items.length,
                  StoryItem.pageImage(
                    url: file.fileUrl,
                    caption: file.caption,
                    controller: storyController,
                  )),
            }
          else if (file.type == "text")
            {
              story_items.insert(
                  story_items.length > 0
                      ? story_items.length - 1
                      : story_items.length,
                  StoryItem.text(
                    title: file.title,
                    backgroundColor: file.bg_colors,
                    textStyle: TextStyle(
                      fontFamily: 'Dancing',
                      fontSize: 40,
                    ),
                  )),
            }
        });
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
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
                child: new Text(name),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            new Icon(Icons.more_vert),
          ]),
      body: StoryView(
        storyItems: story_items,
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          Navigator.pop(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
