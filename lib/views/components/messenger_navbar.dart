import 'package:flutter/material.dart';

BottomNavigationBar getNavBar(int index, BuildContext context) => new BottomNavigationBar(
        currentIndex: index,
        onTap: (page) => _navTap(index, page, context),
        items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.chat), title: new Text('Messages')),
          new BottomNavigationBarItem(icon: new Icon(Icons.people), title: new Text('Contacts')),
        ]);

void _navTap(int index, int page, BuildContext context) =>
    index != page ? Navigator.of(context).pushReplacementNamed('/${page.toString()}') : null;
