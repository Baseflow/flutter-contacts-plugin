part of contacts_plugin;

/// A representation of a note that is linked to a contact.
class Note {
  /// The string representation of the note.
  String content;

  /// Creates a new (empty) instance of the [Note] class.
  Note();

  /// Create a new instance of the [Note] class and populates it's properties based on the supplied JSON message.
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note()..content = json['content'] as String;
  }

  /// Converts the [Note] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => <String, dynamic>{'content': this.content};
}
