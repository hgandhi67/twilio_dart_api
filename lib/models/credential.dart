import 'package:twilio/exceptions/twilio_credential_exception.dart';
import 'package:twilio/utils/credential_utils.dart';

class Credential {
  late final String _accountSid, _authToken;
  late String _twilioNumber, _cred;
  static late Credential instance;

  Credential(String accountSid, String authToken, String twilioNumber) {
    this._accountSid = accountSid;
    this._authToken = authToken;

    if (!CredentialUtil.isValidNumber(twilioNumber))
      throw new TwilioCredentialException('$twilioNumber is not valid number');

    this._twilioNumber = twilioNumber;
    _cred = '$_accountSid:$_authToken';
    instance = this;
  }

  String get accountSid => _accountSid;

  void changeNumber(String number) {
    if (!CredentialUtil.isValidNumber(number))
      throw new TwilioCredentialException('$number is not valid number');

    _twilioNumber = number;
  }

  get authToken => _authToken;

  get twilioNumber => _twilioNumber;

  get cred => _cred;
}
