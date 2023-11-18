import 'dart:convert';

class Note {
  String id;
  String text;

  Note({
    required this.text,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'], text: map['text']);
  }

  String toJson() => jsonEncode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(jsonDecode(source));
}
