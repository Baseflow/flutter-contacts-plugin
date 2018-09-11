part of contacts_plugin;

/// A representation of an email address linked to a contact
class EmailAddress {
  /// The string representation of the email address.
  String address;

  /// A user defined label for this email address.
  String label;

  /// Indicates the type of email address, for example "home" or "work".
  EmailAddressType type;

  /// Creates a new (empty) instance of the [EmailAddress] class.
  EmailAddress();

  /// Create a new instance of the [EmailAddress] class and populates it's properties based on the supplied JSON message.
  factory EmailAddress.fromJson(Map<String, dynamic> json) {
    return EmailAddress()
      ..address = json['address'] as String
      ..label = json['label'] as String
      ..type =
          _JsonCodec._decodeNullableEnum(EmailAddressType.values, json['type']);
  }

  /// Converts the [EmailAddress] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': this.address,
        'label': this.label,
        'type': _JsonCodec._encodeNullableEnum(this.type)
      };
}
