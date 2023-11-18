import 'package:flutter/material.dart';
import 'package:login_app/components/label_component.dart';

import '../models/note_model.dart';

class NoteComponent extends StatelessWidget {
  final Note note;
  final int index;
  final void Function(String) onRemove;
  final void Function(String, int, String) onUpdate;

  const NoteComponent({
    Key? key,
    required this.note,
    required this.index,
    required this.onRemove,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _showConfirmationDialog(BuildContext context) async {
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Confirmação',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text('Deseja realmente excluir essa nota?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Sim'),
              ),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Não'),
              )
            ],
          );
        },
      );
    }

    Future<void> _showUpdateNoteModal(BuildContext context) async {
      await showDialog(
        context: context,
        builder: (context) {
          TextEditingController _newNoteController = TextEditingController();
          return Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Nota antiga',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
                LabelComponent(text: note.text),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Nova nota',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: TextField(
                    controller: _newNoteController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Digite uma nova nota',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
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
                      if (_newNoteController.text.isEmpty) {
                        return;
                      } else {
                        onUpdate(note.id, index, _newNoteController.text);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      note.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _showUpdateNoteModal(context);
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (await _showConfirmationDialog(context)) {
                        onRemove(note.id);
                      }
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1.8,
        ),
      ],
    );
  }
}
