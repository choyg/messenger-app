import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/contact.dart';
import '../entities/thread.dart';

const host = "http://172.17.0.1:3000";

Future<List<dynamic>> getFriends() async {
  const url = "$host/friends";
  http.Response response = await http.get(url);
  List friends = json.decode(response.body);

  var contacts = friends
      .map((friend) => new Contact(friend['userID'], friend['fullName'], friend['profilePicture']))
      .toList();

  contacts.sort((contact1, contact2) => contact1.name.compareTo(contact2.name));

  return contacts;
}

Future<List<Thread>> getRecentMessages() async {
  const url = "$host/recents";
  http.Response response = await http.get(url);
  List messages = json.decode(response.body);
  var deserialized = messages.map((msg) => new Thread.fromJson(msg)).toList();
  return deserialized;
}
