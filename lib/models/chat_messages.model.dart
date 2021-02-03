class ChatMessagesModel {
  final String time;
  final String message;
  final String sender;
  final String deliveryStatus;

  ChatMessagesModel(
      {this.time, this.message, this.sender, this.deliveryStatus});
}

List<ChatMessagesModel> dummyChat = [
  new ChatMessagesModel(
      time: "6:00 am", message: "Hi", sender: "Mr.cooper", deliveryStatus: ""),
  new ChatMessagesModel(
      time: "6:01 am", message: "Hey", sender: "me", deliveryStatus: "seen"),
  new ChatMessagesModel(
      time: "6:01 am",
      message:
          "I got your contact from Willy, actually we heard that sheldon was looking for your from a while and now he went missing.",
      sender: "Mr.cooper",
      deliveryStatus: ""),
  new ChatMessagesModel(
      time: "6:02 am",
      message: "OK, since when is he missing?",
      sender: "me",
      deliveryStatus: "seen"),
  new ChatMessagesModel(
      time: "6:04 am",
      message: "yesterday 😯",
      sender: "Mr.cooper",
      deliveryStatus: ""),
  new ChatMessagesModel(
      time: "6:10 am",
      message: "Strange 😮",
      sender: "me",
      deliveryStatus: "delivered"),
  new ChatMessagesModel(
      time: "8:01 am",
      message: "No, I haven't seen him, hope he gets home sooner.",
      sender: "me",
      deliveryStatus: "sent"),
];
