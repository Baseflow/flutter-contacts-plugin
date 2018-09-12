# Flutter Contacts Plugin  

[![pub package](https://img.shields.io/pub/v/contacts.svg)](https://pub.dartlang.org/packages/contacts)

A Flutter contacts plugin which provides easy access to the platform specific address book.

Branch  | Build Status 
------- | ------------
develop | [![Build Status](https://travis-ci.com/BaseflowIT/flutter-contacts-plugin.svg?branch=develop)](https://travis-ci.com/BaseflowIT/flutter-contacts)
master  | [![Build Status](https://travis-ci.com/BaseflowIT/flutter-contacts-plugin.svg?branch=master)](https://travis-ci.com/BaseflowIT/flutter-contacts)

## Features

* Automatically check and request the necessary permissions to access the platform specific address book;
* Read contacts from the addres book;
* [WIP] Store new contacts in the address book;
* [WIP] Update details of existing contacts;
* [WIP] Delete existing contacts from the address book.

## Usage

To use this plugin, add `contacts_plugin` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). For example:

```yaml
dependencies:
  contacts_plugin: '^0.0.3'
```

> **NOTE:** There's a known issue with integrating plugins that use Swift into a Flutter project created with the Objective-C template. See issue [Flutter#16049](https://github.com/flutter/flutter/issues/16049) for help on integration.

## API

### Fetch all contacts

To fetch all contacts from the address book make a call to the `getContacts` method:

``` dart
import 'package:geolocator/contacts_plugin.dart';

List<Contact> contacts = await ContactsPlugin().getContacts();
```

## Permissions

### Android

On Android you'll need to add either the `READ_CONTACTS` or the `WRITE_CONTACTS` permissions to your Android Manifest (depending if you need read and/ or write access to the address book). Todo so open the AndroidManifest.xml file and one of the following two lines as direct children of the `<manifest>` tag:

``` xml
<uses-permission android:name="android.permission.READ_CONTACTS" />
<uses-permission android:name="android.permission.WRITE_CONTACTS" />
```

### iOS

On iOS you'll need to add the `NSContactsUsageDescription` to your Info.plist file in order to access the device's address book. Simply open your Info.plist file and add the following:

``` xml
<key>NSContactsUsageDescription</key>
<string>This app needs access to address book.</string>
```

## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/BaseflowIT/flutter-contacts-plugin/issues) page.

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](CONTRIBUTING.md) and send us your [pull request](https://github.com/BaseflowIT/flutter-contacts-plugin/pulls).

## Author

This Contacts plugin for Flutter is developed by [Baseflow](https://baseflow.com). You can contact us at <hello@baseflow.com>
