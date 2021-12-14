class CredentialUtil {
  //TODO : Make this better with docs [https://www.twilio.com/docs/api/errors/21211]
  static bool isValidNumber(String number) {
    return number.length > 5;
  }
}
