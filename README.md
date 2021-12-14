# Twilio Flutter

A Flutter package for both android and iOS which helps developers with Twilio API services.

## Features

* Send SMS programmatically;
* Get all SMS related to a Twilio account;


## Getting Started


To use this package :

- add the dependency to your pubspec.yaml file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  twilio: ^0.0.1
```

### How to use


#### Create a new Object
```dart
Twilio twilio = Twilio(
    accountSid : '*************************', // replace *** with Account SID
    authToken : 'xxxxxxxxxxxxxxxxxx',  // replace xxx with Auth Token
    twilioNumber : '+...............'  // replace .... with Twilio Number
    );
```

#### Now you can use any instance of following
```dart
twilio.messages
twilio.credential
```

#### Send Message
```dart
twilio.messages.sendMessage(String toNumber, [String message = ""]); 
   //Use sendMessage with the recipient number and message body.
```

#### View Message List
```dart
//Returns list of SMS 
//pageSize defaults to 10
//Filter out numbers also

MessagesData messagesData = await twilio.getMessageList(
{int pageSize = 10, String? toNumber, String? fromNumber});
```


#### Change Twilio Number
```dart
twilio.credential.changeNumber('+.........'); // To change the twilio number
```

## Supported Platforms

* Android
* iOS
* Web
* MacOs
* Windows
* Linux


## Issues

Please file any issues, bugs or feature requests as an issue on our [GitHub](https://github.com/denishnavadiya123/Twilio/issues) page. Commercial support is available, you can contact us via [mail](mailto:denish@coderthemes.com).

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), Send us your [pull request](https://github.com/denishnavadiya123/Twilio/pulls).

## Author

This Twilio package for Flutter is developed by [Coderthemes Design LLP](https://coderthemes.com/).