// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';

final notesDb = FirebaseFirestore.instance.collection('notes');

class NotesFirestoreService {
  final noteAtt = {
    'note': 'Onix, a',
    'title': 'Carros pra comprar',
    'timestamp': DateTime.now(),
  };

  // CREATE NOTE
  Future<void> createNote(
      String title, String note, BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Impede o fechamento do diálogo ao tocar fora dele
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      final noteObject = Note(
        title: title,
        note: note,
        timestamp: DateTime.now(),
      ).toFirestore();

      await notesDb.add(noteObject);
    } catch (e) {}
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
