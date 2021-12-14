library twilio;

import 'package:twilio/models/credential.dart';
import 'package:twilio/services/message_service.dart';
import 'package:twilio/services/network_service.dart';

export 'services/message_service.dart';

class Twilio {
  late MessageService messages;
  late Credential credential;
  static Twilio? instance;

  Twilio(
      {required String accountSid,
      required String authToken,
      required String twilioNumber}) {
    credential = Credential(accountSid, authToken, twilioNumber);
    messages = MessageService();
    NetworkService().init();
    instance = this;
  }
}
