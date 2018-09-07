part of contacts_plugin;

/// A representation of a note that is linked to a contact.
@JsonSerializable()
class Note {
  /// The string representation of the note.
  String content;

  /// Creates a new (empty) instance of the [Note] class.
  Note();

  /// Create a new instance of the [Note] class and populates it's properties based on the supplied JSON message.
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  /// Converts the [Note] instance to a key / value map which can easily be serialized to a JSON string.
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
