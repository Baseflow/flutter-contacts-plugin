part of contacts_plugin;

@JsonSerializable()
class Website {
  String address;

  Website();

  factory Website.fromJson(Map<String, dynamic> json) =>
      _$WebsiteFromJson(json);

  Map<String, dynamic> toJson() => _$WebsiteToJson(this);
}
