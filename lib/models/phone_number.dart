part of contacts_plugin;

/// A representation of a telephone number for the contact.
@JsonSerializable()
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
  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  /// Converts the [PhoneNumber] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
