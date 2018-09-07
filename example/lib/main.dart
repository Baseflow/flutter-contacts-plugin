import 'dart:math';

import 'package:flutter/material.dart';
import 'package:contacts_plugin/contacts_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new SafeArea(
          child: ContactListWidget(),
        ),
      ),
    );
  }
}

class ContactListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactsPlugin().getContacts(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          children:
              snapshot.data.map((contact) => ContactWidget(contact)).toList(),
        );
      },
    );
  }
}

class ContactWidget extends StatelessWidget {
  final Contact _contact;

  ContactWidget(this._contact);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor:
              Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
          child:
              Text(_contact.displayName?.substring(0, 1)?.toUpperCase() ?? "")),
      title: Text(_contact.displayName ?? "<null>"),
    );
  }
}
