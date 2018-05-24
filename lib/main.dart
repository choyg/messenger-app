import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'functions/fcm.dart';
import 'views/contacts.dart';
import 'views/messages.dart';

void main() {
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  runApp(new MyApp());
  initPushNotis(_firebaseMessaging);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Messenger Clean',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent,
        ),
        home: new Messages(title: 'Messages'),
        routes: <String, WidgetBuilder>{
          '/0': (BuildContext context) => new Messages(
                title: 'Messages',
                index: 0,
              ),
          '/1': (BuildContext context) => new Contacts(
                title: 'Contacts',
                index: 1,
              ),
        });
  }
}
