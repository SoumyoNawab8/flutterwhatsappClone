class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final String isNew;

  ChatModel({this.name, this.message, this.time, this.avatarUrl, this.isNew});
}

List<ChatModel> dummyData = [
  new ChatModel(
    name: "Mr.Cooper",
    message: "Hey! Have you seen Sheldon in a while?",
    time: "12:00 pm",
    isNew: "true",
    avatarUrl:
        "https://img.sharetv.com/shows/characters/large/young_sheldon.george_cooper_sr.jpg",
  ),
  new ChatModel(
    name: "Meemaw",
    message: "Where is my moonpie 😓",
    time: "09:58 am",
    isNew: "false",
    avatarUrl:
        "https://static.wikia.nocookie.net/bigbangtheory/images/8/8b/MeemawYS.jpg/revision/latest?cb=20180108222825",
  ),
  new ChatModel(
    name: "Mary Cooper",
    message: "Where is sheldon?",
    time: "Yesterday",
    isNew: "false",
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJbq111ggNlYY0qiXEcg22Y9qCf4chZASQ2A&usqp=CAU",
  ),
  new ChatModel(
    name: "Mr. Givens",
    message: "Thanks God 😍, Sheldon is missing",
    time: "Yesterday",
    isNew: "false",
    avatarUrl:
        "https://d29l8fj0bhi1tg.cloudfront.net/wp-content/uploads/2017/11/17121501/Screen-Shot-2018-01-17-at-12.29.28.jpg",
  ),
  new ChatModel(
    name: "Missy Cooper",
    message: "Well now, I kinda miss sheldon 😢",
    time: "Yesterday",
    isNew: "false",
    avatarUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUfAT9ZZaEXHO8spIxx24xjyWIECAa8nn9w&usqp=CAU",
  ),
];
