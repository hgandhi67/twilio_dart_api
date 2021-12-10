import 'message.dart';

class MessagesData {


  final List<Message> messages;

  MessagesData(this.messages);

  static MessagesData fromJSON(Map<String, dynamic> json) {
    List<Message> messages = Message.fromJSONList(json["messages"]);
    return MessagesData(messages);
  }

  @override
  String toString() {
    return 'MessagesData{messages: $messages}';
  }
}