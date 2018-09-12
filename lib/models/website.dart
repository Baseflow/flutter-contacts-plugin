part of contacts_plugin;

/// A representation of a website related to a contact.
class Website {
  /// Represents the URL (or web address) of the website.
  String address;

  /// Creates a new (empty) instance of the [Website] class.
  Website();

  /// Create a new instance of the [Website] class and populates it's properties based on the supplied JSON message.
  factory Website.fromJson(Map<String, dynamic> json) {
    return Website()..address = json['address'] as String;
  }

  /// Converts the [Website] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{'address': this.address};
}
