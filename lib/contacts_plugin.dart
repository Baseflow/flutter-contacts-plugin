library contacts_plugin;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data/contact_enums.dart';
part 'models/address.dart';
part 'models/contact.dart';
part 'models/email_address.dart';
part 'models/instant_messaging_account.dart';
part 'models/note.dart';
part 'models/organization.dart';
part 'models/phone_number.dart';
part 'models/relationship.dart';
part 'models/website.dart';
part 'contacts_plugin.g.dart';

class ContactsPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter.baseflow.com/contacts_plugin/methods');

  static Future<List<Contact>> get contacts async {
    final dynamic jsonString = await _channel.invokeMethod('getContacts');
    final List<dynamic> jsonObjects = json.decode(jsonString);
    final List<Contact> contacts =
        jsonObjects.map((jsonObject) => Contact.fromJson(jsonObject)).toList();
    return contacts;
  }
}
