part of contacts_plugin;

@JsonSerializable()
class PhoneNumber {
  String label;
  String number;
  PhoneNumberType type;

  PhoneNumber();

  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}
