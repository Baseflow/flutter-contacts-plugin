library contacts_plugin;

import 'dart:async';

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
  static const MethodChannel _channel = const MethodChannel('contacts');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
