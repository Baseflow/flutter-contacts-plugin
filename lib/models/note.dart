part of contacts_plugin;

@JsonSerializable()
class Note {
  String contents;

  Note();

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
