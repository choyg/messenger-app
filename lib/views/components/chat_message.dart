import 'package:flutter/material.dart';

import '../../entities/contact.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.contact, this.isUser});

  final String text;
  final Contact contact;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child:
                new CircleAvatar(radius: 16.0, backgroundImage: new NetworkImage(contact.avatar)),
          ),
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(
                text,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
