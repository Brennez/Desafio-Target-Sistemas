import 'dart:convert';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_model.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  @observable
  var _notes = ObservableList<Note>();

  @computed
  ObservableList<Note> get notes => ObservableList.of(_notes);

  @action
  Future<void> loadSavedNotes() async {
    _notes = ObservableList.of(await loadNotes());
  }

  @action
  void addNote(String note) {
    final newNote = Note(text: note, id: Random().nextDouble().toString());

    _notes.insert(0, newNote);

    saveNotes(_notes);
  }

  @action
  void remove(String id) {
    _notes.removeWhere((note) => note.id == id);
    saveNotes(notes);
  }

  @action
  void update(String id, int index, String newText) {
    final oldNote = _notes.firstWhere((note) => note.id == id);
    final newNote = Note(text: newText, id: oldNote.id);
    _notes.removeAt(index);
    _notes.insert(index, newNote);
    saveNotes(_notes);
  }

  @action
  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final serializedNotes = notes.map((note) => note.toJson()).toList();
    await prefs.setStringList('data', serializedNotes);
  }

  @action
  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final serializedNotes = prefs.getStringList('data') ?? [];
    return serializedNotes
        .map((jsonString) => Note.fromJson(jsonString))
        .toList();
  }
}
