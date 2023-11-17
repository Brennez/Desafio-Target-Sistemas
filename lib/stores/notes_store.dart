import 'dart:math';

import 'package:mobx/mobx.dart';

import '../models/note_model.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  @observable
  var _notes = ObservableList<Note>();

  @computed
  ObservableList<Note> get notes => ObservableList.of(_notes);

  @action
  void addNote(String note) {
    final newNote = Note(text: note, id: Random().nextDouble().toString());

    _notes.insert(0, newNote);
  }

  @action
  void remove(String id) {
    _notes.removeWhere((note) => note.id == id);
  }

  @action
  void update(String id, int index, String newText) {
    final oldNote = _notes.firstWhere((note) => note.id == id);
    final newNote = Note(text: newText, id: oldNote.id);
    _notes.removeAt(index);
    _notes.insert(index, newNote);
  }
}
