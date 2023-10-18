// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/note.dart';
import '../view/widgets/toast.dart';

final notesDb = FirebaseFirestore.instance.collection('notes');

class NotesFirestoreService {
  final noteAtt = {
    'note': 'Onix, a',
    'title': 'Carros pra comprar',
    'timestamp': DateTime.now(),
  };

  // CREATE NOTE
  Future<void> createNote(
    String title,
    String note,
    BuildContext context,
  ) async {
    try {
      final docNote = notesDb.doc();
      final noteObject = Note(
        noteId: docNote.id,
        title: title,
        note: note,
        timestamp: DateTime.now().toString(),
      ).toFirestore();

      await docNote.set(noteObject);
    } catch (e) {
      if (context.mounted) context.pop();
      if (context.mounted) showToast(context, message: 'Error creating note!');
    }
  }

  // DELETE NOTE
  Future<void> deleteNote(
    String noteId,
    BuildContext context,
  ) async {
    try {
      notesDb.doc(noteId).delete();
      if (context.mounted) context.pop();
      if (context.mounted) showToast(context, message: 'Note Deleted!');
    } catch (e) {
      if (context.mounted) showToast(context, message: 'Error deleting note!');
    }
  }

  // UPDATE NOTE
  Future<void> updateNote(String noteId) {
    return notesDb.doc(noteId).update(noteAtt).then(
          (value) => print('Document updated!'),
          onError: (e) => print("Error: $e"),
        );
  }

  // READ NOTES
  Stream<List<Note>> readNotes() {
    return notesDb.orderBy('timestamp', descending: true).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Note.fromFirestore(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
