part of contacts_plugin;

@JsonSerializable()
class Address {
  AddressType type;
  String label;
  String streetAddress;
  String city;
  String region;
  String country;
  String postalCode;

  Address();

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
