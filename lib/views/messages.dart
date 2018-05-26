import 'package:flutter/material.dart';

import "dart:math";
import '../entities/thread.dart';
import '../entities/contact.dart';
import '../api/messenger_api.dart';
import 'components/messenger_navbar.dart';
import 'conversation.dart';

class Messages extends StatefulWidget {
  Messages({Key key, this.title, this.index = 0}) : super(key: key);

  final String title;
  final index;

  @override
  _MessagesState createState() => new _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Thread> threads = [];

  @override
  void initState() {
    super.initState();
    _setRecentThreads();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text(widget.title),
      ),*/
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Search',
        child: new Icon(Icons.search),
      ),
      bottomNavigationBar: getNavBar(widget.index, context),
      body: getMessagesBody(),
    );
  }

  Widget getMessagesBody() {
    if (threads.length == 0) return new Center(child: new CircularProgressIndicator());
    return new ListView.builder(
      //padding: new EdgeInsets.only(top: 16.0),
      itemCount: threads.length,
      itemExtent: 72.0,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          onTap: () {
            _messageTap(index);
          },
          child: new ListTile(
            title: new Text(threads[index].name),
            subtitle: new Text(threads[index].message),
            leading: new Icon(Icons.person, color: _getRandomColor()),
          ),
        );
      },
    );
  }

  void _messageTap(index) {
    var thread = threads[index];
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => new Conversation(thread.name, thread.threadID)));
  }

  _setRecentThreads() async {
    threads = await getRecentMessages();
    mounted ? setState(() => {}) : null;
  }

  _getRandomColor() {
    var colors = [
      Colors.amber,
      Colors.black,
      Colors.blue,
      Colors.brown,
      Colors.cyan,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.white
    ];
    final _random = new Random();
    return colors[_random.nextInt(colors.length)];
  }
}
