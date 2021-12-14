import 'package:twilio/exceptions/twilio_instance_exception.dart';
import 'package:twilio/models/message.dart';
import 'package:twilio/twilio.dart';

extension MessageExtension on Message {
  bool get fromMe {
    if (Twilio.instance == null &&
        Twilio.instance!.credential.twilioNumber == null) {
      throw TwilioInstanceException();
    }
    return Twilio.instance!.credential.twilioNumber == this.from;
  }
}
