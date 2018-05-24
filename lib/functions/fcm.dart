import 'package:firebase_messaging/firebase_messaging.dart';

String _token;

/// TODO Finish wiring push notifications.
///
/// Mostly copied from the Flutter example at
/// https://pub.dartlang.org/packages/firebase_messaging#-example-tab-
void initPushNotis(FirebaseMessaging _firebaseMessaging) {
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) {
      print("onMessage: $message");
    },
    onLaunch: (Map<String, dynamic> message) {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) {
      print("onResume: $message");
    },
  );
  _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true));
  _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
    print("Settings registered: $settings");
  });
  _firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    print(token);
    _token = token;
  });
}

String getToken() => _token;
