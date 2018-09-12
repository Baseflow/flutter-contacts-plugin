part of contacts_plugin;

/// A representation of an organization linked to a contact.
class Organization {
  /// The contact's job title
  String jobTitle;

  /// A user defined label for this organization.
  String label;

  /// The name of the organization.
  String name;

  /// Indicates the type of organization in relation to the contact, for example "work".
  OrganizationType type;

  /// Creates a new (empty) instance of the [Organization] class.
  Organization();

  /// Create a new instance of the [Organization] class and populates it's properties based on the supplied JSON message.
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization()
      ..jobTitle = json['jobTitle'] as String
      ..label = json['label'] as String
      ..name = json['name'] as String
      ..type =
          _JsonCodec._decodeNullableEnum(OrganizationType.values, json['type']);
  }

  /// Converts the [Organization] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'jobTitle': this.jobTitle,
        'label': this.label,
        'name': this.name,
        'type': _JsonCodec._encodeNullableEnum(this.type)
      };
}
