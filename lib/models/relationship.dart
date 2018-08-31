part of contacts_plugin;

@JsonSerializable()
class Relationship {
  String name;
  RelationshipType type;

  Relationship();

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);
}
