import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_app/components/note_component.dart';
import 'package:login_app/components/text_button_component.dart';
import 'package:login_app/stores/notes_store.dart';

final notesStore = NotesStore();

class InformationsScreen extends StatefulWidget {
  const InformationsScreen({super.key});

  @override
  State<InformationsScreen> createState() => _InformationsScreenState();
}

class _InformationsScreenState extends State<InformationsScreen> {
  @override
  void initState() {
    super.initState();
    notesStore.loadSavedNotes().then((_) {
      print('CONCLUIDO');
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _fieldController = TextEditingController();

    void removeNote(String id) {
      notesStore.remove(id);
    }

    void updateNote(String id, int index, String newText) {
      notesStore.update(id, index, newText);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff20596A),
                Color(0xff2A8985),
              ]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Observer(
                        builder: (context) => ListView.builder(
                          itemCount: notesStore.notes.length,
                          itemBuilder: (context, index) {
                            return NoteComponent(
                              note: notesStore.notes[index],
                              index: index,
                              onRemove: removeNote,
                              onUpdate: updateNote,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Observer(
                    builder: (context) => TextField(
                      controller: _fieldController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Digite seu texto',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onSubmitted: (_) {
                        if (_fieldController.text.isEmpty) {
                          return;
                        } else {
                          notesStore.addNote(_fieldController.text);
                          _fieldController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: TextButtonComponent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
