part of contacts_plugin;

/// A representation of the postal address for a contact.
@JsonSerializable()
class Address {
  /// Indicates the type of Address, for example Home or Work.
  AddressType type;

  /// An user defined label for this address.
  String label;

  /// The street name of the address.
  String streetAddress;

  /// The city name of the address.
  String city;

  /// The name of the region (for example state or province) of the address.
  String region;

  /// The country name of the address.
  String country;

  /// The postal code of the address.
  String postalCode;

  /// Creates a new (empty) instance of the [Address] class.
  Address();

  /// Create a new instance of the [Address] class and populates it's properties based on the supplied JSON message.
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Converts the [Address] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
