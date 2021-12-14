import 'package:twilio/exceptions/twilio_network_exception.dart';

class TwilioResponseException extends TwilioNetworkException {
  final int status;

  TwilioResponseException(this.status, String message) : super(message);

  @override
  String toString() {
    return 'TwilioResponseException{status: $status, message: $message}';
  }
}
