part of contacts_plugin;

/// A representation of a telephone number for the contact.
class PhoneNumber {
  /// A user defined label for this telephone number.
  String label;

  /// The string value of the telephone number.
  String number;

  /// Indicates the type of telephone number, for example "home", "work" or "mobile".
  PhoneNumberType type;

  /// Creates a new (empty) instance of the [PhoneNumber] class.
  PhoneNumber();

  /// Create a new instance of the [PhoneNumber] class and populates it's properties based on the supplied JSON message.
  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    return PhoneNumber()
      ..label = json['label'] as String
      ..number = json['number'] as String
      ..type =
          _JsonCodec._decodeNullableEnum(PhoneNumberType.values, json['type']);
  }

  /// Converts the [PhoneNumber] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'label': this.label,
        'number': this.number,
        'type': _JsonCodec._encodeNullableEnum(this.type)
      };
}
