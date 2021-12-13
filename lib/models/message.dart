import 'package:intl/intl.dart';

class Message {
  final String from, to, body, direction;
  final DateTime sendAt;

  Message(this.from, this.to, this.body, this.sendAt, this.direction);

  static Message fromJSON(Map<String, dynamic> json) {
    String from = json['from'].toString();
    String to = json['to'].toString();
    String body = json['body'].toString();
    String dateSent = (json['date_sent'] ?? json['date_created']).toString();
    DateTime sendAt = DateFormat("dd MMM y HH:mm:ss")
        .parse(((dateSent.split(",")[1]).split("+")[0]).trim());
    String direction = json['direction'].toString();
    return Message(from, to, body, sendAt, direction);
  }

  static List<Message> fromJSONList(List<dynamic> list) {
    List<Message> messages = [];
    for (Map<String, dynamic> json in list) {
      messages.add(fromJSON(json));
    }
    return messages;
  }

  @override
  String toString() {
    return 'Message{from: $from, body: $body, direction: $direction}';
  }
}
