import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/contact.dart';

const host = "http://172.17.0.1:3000";

Future<List<dynamic>> getFriends() async {
  const url = "$host/friends";
  http.Response response = await http.get(url);
  List friends = JSON.decode(response.body);

  var contacts = friends.map((friend) =>
  new Contact(friend['userID'], friend['fullName'], friend['profilePicture']))
      .toList();

  contacts.sort((contact1, contact2) => contact1.name.compareTo(contact2.name));

  return contacts;
}