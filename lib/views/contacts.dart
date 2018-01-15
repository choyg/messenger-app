import 'package:flutter/material.dart';

import '../api/messenger_api.dart';
import '../entities/contact.dart';
import 'components/messenger_navbar.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key, this.title, this.index = 0}) : super(key: key);

  final String title;
  final index;

  @override
  _ContactsState createState() => new _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    _setFriends();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Search',
        child: new Icon(Icons.search),
      ),
      bottomNavigationBar: getNavBar(widget.index, context),
      body: getContactsBody(),
    );
  }

  Widget getContactsBody() {
    if (contacts.length == 0)
      return new Center(child: new CircularProgressIndicator());
    return new ListView.builder(
      //padding: new EdgeInsets.only(top: 16.0),
      itemCount: contacts.length,
      itemExtent: 72.0,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          onTap: () {
            _contactsTap(index);
          },
          child: new ListTile(
            title: new Text(contacts[index].name),
            leading: new CircleAvatar(
              radius: 16.0,
              backgroundImage: new NetworkImage(contacts[index].avatar),
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }

  void _contactsTap(int index) {
    var contact = contacts[index];
    print(contact);
  }

  _setFriends() async {
    contacts = await getFriends();
    mounted ? setState(() => {}) : null;
  }
}