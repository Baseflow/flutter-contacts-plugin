part of contacts_plugin;

@JsonSerializable()
class Organization {
  String contactTitle;
  String label;
  String name;
  OrganizationType type;

  Organization();

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
