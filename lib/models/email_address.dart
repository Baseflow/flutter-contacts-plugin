part of contacts_plugin;

/// A representation of an email address linked to a contact
@JsonSerializable()
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
  factory EmailAddress.fromJson(Map<String, dynamic> json) =>
      _$EmailAddressFromJson(json);

  /// Converts the [EmailAddress] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => _$EmailAddressToJson(this);
}
