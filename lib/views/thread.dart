import 'package:flutter/material.dart';

import 'components/chat_message.dart';

class Threads extends StatefulWidget {
  Threads(this.name, this.threadId, {Key key}) : super(key: key);

  final String name;
  final String threadId;

  @override
  _ThreadsState createState() => new _ThreadsState();
}

class _ThreadsState extends State<Threads> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
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
      contact: new Contact("100000255123333", "Username",
          "https://scontent-dft4-3.xx.fbcdn.net/v/t1.0-1/c0.7.32.32/p32x32/17156164_1037829236361793_1032450747588821100_n.jpg?oh=615f64fd28cf07003efef72663ea9b8d&oe=5AE6B632"),
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  _setFriends() async {
    //contacts = await getFriends();
    mounted ? setState(() => {}) : null;
  }
}
