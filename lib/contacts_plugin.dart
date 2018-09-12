library contacts_plugin;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

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
part 'utils/json_codec.dart';

/// Provides easy access to the platform specific address book (using the Contacts SDK on iOS and the Contacts Provider on Android)
class ContactsPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter.baseflow.com/contacts_plugin/methods');

  /// Returns a [Future] containing a list of all contacts ([List<Contact>]) available on the platform.
  Future<List<Contact>> getContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();

    if (permissionStatus == PermissionStatus.granted) {
      final dynamic jsonString = await _channel.invokeMethod('getContacts');
      final List<dynamic> jsonObjects = json.decode(jsonString);
      final List<Contact> contacts = jsonObjects
          .map((jsonObject) => Contact.fromJson(jsonObject))
          .toList();

      return contacts;
    } else {
      _handleInvalidPermissions(permissionStatus);
    }

    return null;
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);

      return permissionStatus[PermissionGroup.contacts] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to location data denied",
          details: null);
    } else if (permissionStatus == PermissionStatus.disabled) {
      throw new PlatformException(
          code: "PERMISSION_DISABLED",
          message: "Location data is not available on device",
          details: null);
    }
  }
}
