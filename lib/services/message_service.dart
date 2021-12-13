import 'dart:convert';
import 'dart:developer';

import 'package:twilio/models/credential.dart';
import 'package:twilio/models/message.dart';
import 'package:twilio/models/messages_data.dart';
import 'package:twilio/services/network_service.dart';

class MessageService {
  Future<MessagesData?> getMessageList(
      {int pageSize = 10, String? toNumber, String? fromNumber}) async {
    String url = NetworkService.instance.url + '?PageSize=$pageSize';
    if (fromNumber != null) {
      url += '&From=$fromNumber';
    }
    if (toNumber != null) {
      url += "&To=$toNumber";
    }
    NetworkResponse? response = await NetworkService.instance.get(url);
    if (response != null) {
      MessagesData messagesData =
          MessagesData.fromJSON(json.decode(response.body));

      return messagesData;
    } else {
      log("Something wrong");
    }
  }

  Future<Message?> sendMessage(String toNumber, [String message = ""]) async {
    String url = NetworkService.instance.url;
    Map<String, String> body = {
      'From': Credential.instance.twilioNumber,
      'To': toNumber,
      'Body': message
    };
    NetworkResponse? response = await NetworkService.instance.post(url, body);
    if (response != null) {
      Message message = Message.fromJSON(json.decode(response.body));
      return message;
    } else {
      log("Something wrong");
    }
  }
}
