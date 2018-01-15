import 'package:flutter/material.dart';

import 'components/messenger_navbar.dart';

class Messages extends StatefulWidget {
  Messages({Key key, this.title, this.index = 0}) : super(key: key);

  final String title;
  final index;

  @override
  _MessagesState createState() => new _MessagesState();
}

class _MessagesState extends State<Messages> {

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
      body: new ListView.builder(
        //padding: new EdgeInsets.only(top: 16.0),
        itemExtent: 96.0,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            onTap: () {
              _messageTap();
            },
            child: new ListTile(
              title: new Text('Foo Bar'),
              subtitle: new Text('Hello\nyou: something\nwow!'),
              leading: new Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  void _messageTap() {
  }
}