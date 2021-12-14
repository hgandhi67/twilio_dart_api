import 'dart:convert';

import 'package:twilio/exceptions/message_failed_exception.dart';
import 'package:twilio/models/credential.dart';
import 'package:twilio/models/message.dart';
import 'package:twilio/models/messages_data.dart';
import 'package:twilio/services/network_service.dart';
import 'package:twilio/utils/network_utils.dart';

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
      Map<String, dynamic> responseMap = json.decode(response.body);

      int? status = int.tryParse(responseMap['status'].toString());
      if (status != null && !NetworkUtils.statusInSuccess(status)) {
        throw new MessageFailedException(
            status, responseMap['message'].toString());
      }

      MessagesData messagesData = MessagesData.fromJSON(responseMap);

      return messagesData;
    } else {
      //TODO: Need to implement exception
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
      Map<String, dynamic> responseMap = json.decode(response.body);

      int? status = int.tryParse(responseMap['status'].toString());
      if (status != null && !NetworkUtils.statusInSuccess(status)) {
        throw new MessageFailedException(
            status, responseMap['message'].toString());
      }

      Message message = Message.fromJSON(responseMap);
      return message;
    } else {
      //TODO: Need to implement exception
    }
  }
}
