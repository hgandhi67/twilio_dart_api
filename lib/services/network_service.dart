import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twilio/exceptions/twilio_network_exception.dart';
import 'package:twilio/models/credential.dart';

class NetworkResponse {
  late String _body;
  late int _statusCode;
  late http.Response _baseResponse;

  NetworkResponse(this._body, this._statusCode, this._baseResponse) {
    _body = body;
    _statusCode = statusCode;
    _baseResponse = baseResponse;
  }

  int get statusCode => _statusCode;

  String get body => _body;

  http.Response get baseResponse => _baseResponse;

  @override
  String toString() {
    return 'NetworkResponse{_body: $_body, _statusCode: $_statusCode, _baseResponse: $_baseResponse}';
  }
}

class NetworkService {
  static late NetworkService instance;

  static const String _baseUri = "https://api.twilio.com";
  static const String _version = '2010-04-01';

  late String url;
  late Map<String, String> headers;

  NetworkService() {}

  init() {
    instance = this;
    Credential credential = Credential.instance;
    url = '$_baseUri/$_version/Accounts/${credential.accountSid}/Messages.json';

    initHeader();
  }

  //Headers
  initHeader() {
    String credential = Credential.instance.cred;
    var bytes = utf8.encode(credential);
    var base64Str = base64.encode(bytes);
    headers = {
      'Authorization': 'Basic $base64Str',
      'Accept': 'application/json'
    };
  }

  Future<NetworkResponse?> get(String url) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      return NetworkResponse(response.body, response.statusCode, response);
    } catch (e) {
      throw new TwilioNetworkException(e.toString());
    }
  }

  Future<NetworkResponse?> post(String url,
      [Map<String, dynamic>? body]) async {
    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      return NetworkResponse(response.body, response.statusCode, response);
    } catch (e) {
      throw new TwilioNetworkException(e.toString());
    }
  }
}
