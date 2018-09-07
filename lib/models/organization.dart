part of contacts_plugin;

/// A representation of an organization linked to a contact.
@JsonSerializable()
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
  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  /// Converts the [Organization] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
