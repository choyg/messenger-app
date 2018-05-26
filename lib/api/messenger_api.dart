import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/contact.dart';
import '../entities/thread.dart';
import '../views/components/chat_message.dart';

const host = "http://172.17.0.1:3000";

/// Retrieves all friends of current user
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

/// Retrieves a list of most recent messages
Future<List<Thread>> getRecentMessages() async {
  const url = "$host/recents";
  http.Response response = await http.get(url);
  List messages = json.decode(response.body);
  var deserialized = messages.map((msg) => new Thread.fromJson(msg)).toList();
  return deserialized;
}

/// Retrieves the conversation history of a specific thread
Future<Iterable<dynamic>> getConversationHistory(String threadID) async {
  final url = "$host/thread/$threadID";
  http.Response response = await http.get(url);
  List chatMessages = json.decode(response.body);
  chatMessages = chatMessages.reversed.toList();
  final deserialized = chatMessages.map((msg) => new ChatMessage(
      text: msg['body'],
      contact: new Contact(msg['senderID'], msg['senderName'], msg['senderAvatar'])));
  return deserialized;
}

/// Performs a GET HTTP request
/// Wraps the code needed for running the request and handles exponential backoff
/* Future<http.Response> _get(final String url, {final int backoffCount = 0}) async {
  http.Response response = await http.get(url);
  if (response.statusCode >= 200 && response.statusCode < 300) return response;
}
 */
