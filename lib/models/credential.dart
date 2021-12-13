class Credential {
  final String _accountSid, _authToken;
  late String _twilioNumber, _cred;
  static late Credential instance;

  Credential(this._accountSid, this._authToken, this._twilioNumber) {
    _cred = '$_accountSid:$_authToken';
    instance = this;
  }

  String get accountSid => _accountSid;

  void changeNumber(String number) {
    _twilioNumber = number;
  }

  get authToken => _authToken;

  get twilioNumber => _twilioNumber;

  get cred => _cred;
}
