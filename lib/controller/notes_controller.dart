import 'package:flutter/material.dart';

import '../model/note.dart';
import 'notes_firestore_service.dart';

final notesFirestoreService = NotesFirestoreService();

void updateNote({required Note updatedNote, required Note oldnote}) {
  notesFirestoreService.updateNote(updatedNote: updatedNote, oldnote: oldnote);
}

void deleteNote(BuildContext context, String noteId) async {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Column(
        children: [
          const Text('Deseja deletar essa nota?'),
          const SizedBox(height: 30),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  notesFirestoreService.deleteNote(noteId, context);
                },
                child: const Text('Sim'),
              ),
              const SizedBox(width: 30),
              ElevatedButton(onPressed: () {}, child: const Text('Não')),
            ],
          )
        ],
      ),
    ),
  );
}
