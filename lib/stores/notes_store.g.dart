// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStore, Store {
  Computed<ObservableList<Note>>? _$notesComputed;

  @override
  ObservableList<Note> get notes =>
      (_$notesComputed ??= Computed<ObservableList<Note>>(() => super.notes,
              name: '_NotesStore.notes'))
          .value;

  late final _$_notesAtom = Atom(name: '_NotesStore._notes', context: context);

  @override
  ObservableList<Note> get _notes {
    _$_notesAtom.reportRead();
    return super._notes;
  }

  @override
  set _notes(ObservableList<Note> value) {
    _$_notesAtom.reportWrite(value, super._notes, () {
      super._notes = value;
    });
  }

  late final _$_NotesStoreActionController =
      ActionController(name: '_NotesStore', context: context);

  @override
  void addNote(String note) {
    final _$actionInfo =
        _$_NotesStoreActionController.startAction(name: '_NotesStore.addNote');
    try {
      return super.addNote(note);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(String id) {
    final _$actionInfo =
        _$_NotesStoreActionController.startAction(name: '_NotesStore.remove');
    try {
      return super.remove(id);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(String id, String newText) {
    final _$actionInfo =
        _$_NotesStoreActionController.startAction(name: '_NotesStore.update');
    try {
      return super.update(id, newText);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
