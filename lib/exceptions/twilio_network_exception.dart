import 'package:twilio/exceptions/twilio_exception.dart';

class TwilioNetworkException extends TwilioException {
  final String message;

  TwilioNetworkException(this.message);

  @override
  String toString() {
    return 'TwilioNetworkException{message: $message}';
  }
}
