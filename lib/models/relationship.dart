part of contacts_plugin;

/// A representation of a relation between the contact and the user.
class Relationship {
  /// The name of the related contact.
  String name;

  /// Indicates the type of relation between the contact and the user, for example "father", "sister" or "spouse".
  RelationshipType type;

  /// Creates a new (empty) instance of the [Relationship] class.
  Relationship();

  /// Create a new instance of the [Relationship] class and populates it's properties based on the supplied JSON message.
  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship()
      ..name = json['name'] as String
      ..type =
          _JsonCodec._decodeNullableEnum(RelationshipType.values, json['type']);
  }

  /// Converts the [Relationship] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': this.name,
        'type': _JsonCodec._encodeNullableEnum(this.type)
      };
}
