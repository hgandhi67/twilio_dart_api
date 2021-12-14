import 'package:twilio/exceptions/twilio_response_exception.dart';

class MessageFailedException extends TwilioResponseException {
  MessageFailedException(int status, String message) : super(status, message);
}
