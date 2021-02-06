class CallsModel {
  final String name;
  final String type;
  final String time;
  final String avatarUrl;
  final String call_type;
  // final String isNew;

  CallsModel({this.name, this.type, this.time, this.avatarUrl, this.call_type});
}

List<CallsModel> dummyData = [
  new CallsModel(
    name: "Mr.Cooper",
    type: "missed",
    time: "12:00 pm",
    call_type: "video",
    avatarUrl:
        "https://img.sharetv.com/shows/characters/large/young_sheldon.george_cooper_sr.jpg",
  ),
  new CallsModel(
    name: "Mr.Cooper",
    type: "incoming",
    time: "09:58 am",
    call_type: "audio",
    avatarUrl:
        "https://img.sharetv.com/shows/characters/large/young_sheldon.george_cooper_sr.jpg",
  ),
  new CallsModel(
    name: "Marry Cooper",
    type: "outgoing",
    time: "Yesterday",
    call_type: "video",
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJbq111ggNlYY0qiXEcg22Y9qCf4chZASQ2A&usqp=CAU",
  ),
  new CallsModel(
    name: "Mr.Cooper",
    type: "outgoing",
    time: "Yesterday",
    call_type: "audio",
    avatarUrl:
        "https://img.sharetv.com/shows/characters/large/young_sheldon.george_cooper_sr.jpg",
  ),
  new CallsModel(
    name: "Marry Cooper",
    type: "incoming",
    time: "Yesterday",
    call_type: "video",
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJbq111ggNlYY0qiXEcg22Y9qCf4chZASQ2A&usqp=CAU",
  ),
];
