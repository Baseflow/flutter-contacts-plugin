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
          child: ContactsWidget(),
        ),
      ),
    );
  }
}

class ContactsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactsPlugin.contacts,
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data
              .map((contact) => ListTile(
                    title: Text("${contact.lastName} ${contact.firstName}"),
                  ))
              .toList(),
        );
      },
    );
  }
}
