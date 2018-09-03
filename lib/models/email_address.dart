part of contacts_plugin;

@JsonSerializable()
class EmailAddress {
  String address;
  String label;
  EmailAddressType type;

  EmailAddress();

  factory EmailAddress.fromJson(Map<String, dynamic> json) =>
      _$EmailAddressFromJson(json);

  Map<String, dynamic> toJson() => _$EmailAddressToJson(this);
}
