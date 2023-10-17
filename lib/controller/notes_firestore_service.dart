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
      final noteObject = Note(
        title: title,
        note: note,
        timestamp: DateTime.now(),
      ).toFirestore();

      await notesDb.add(noteObject);
    } catch (e) {
      if (context.mounted) context.pop();
      if (context.mounted) showToast(context, message: 'Error creating note!');
    }
  }

  // DELETE NOTE
  Future<void> deleteNote(String noteId) {
    return notesDb.doc(noteId).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error: $e"),
        );
  }

  // UPDATE NOTE
  Future<void> updateNote(String noteId) {
    return notesDb.doc(noteId).update(noteAtt).then(
          (value) => print('Document updated!'),
          onError: (e) => print("Error: $e"),
        );
  }
}
