import 'package:twilio/exceptions/twilio_exception.dart';

class TwilioCredentialException extends TwilioException {
  final String message;

  TwilioCredentialException(this.message);

  @override
  String toString() {
    return 'TwilioCredentialException{message: $message}';
  }
}
