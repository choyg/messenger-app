import 'package:flutter/material.dart';

import 'components/chat_message.dart';
import '../entities/contact.dart';
import '../api/messenger_api.dart';

class Conversation extends StatefulWidget {
  Conversation(this.name, this.threadId, {Key key}) : super(key: key);

  final String name;
  final String threadId;

  @override
  _ThreadsState createState() => new _ThreadsState();
}

class _ThreadsState extends State<Conversation> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _setMsgs();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.name),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (context, index) => _messages[index],
            itemCount: _messages.length,
          )),
          new Divider(height: 2.0),
          new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer()),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: (text) => _handleSubmitted(text),
              decoration: new InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(
                  Icons.send,
                  color: Colors.blueAccent,
                ),
                onPressed: () => _handleSubmitted(_textController.text)),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      contact: new Contact("100000255123333", "Username", ""),
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  _setMsgs() async {
    final msges = await getConversationHistory(widget.threadId);
    _messages.insertAll(0, msges);
    mounted ? setState(() => {}) : null;
  }
}
