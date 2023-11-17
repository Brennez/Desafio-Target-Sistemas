import 'package:flutter/material.dart';

import '../models/note_model.dart';

class NoteComponent extends StatelessWidget {
  final Note note;
  final void Function(String) onRemove;

  const NoteComponent({
    Key? key,
    required this.note,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showConfirmationDialog(BuildContext context) async {
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
                  Text(
                    note.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (await showConfirmationDialog(context)) {
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
