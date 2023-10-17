// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

final notesDb = FirebaseFirestore.instance.collection('notes');

class FirestoreService {
  final note = {
    'note': 'Bmw X6, Tracker Novo, Novo HRV',
    'title': 'Carros pra comprar',
    'timestamp': DateTime.now(),
  };

  final noteAtt = {
    'note': 'Onix, a',
    'title': 'Carros pra comprar',
    'timestamp': DateTime.now(),
  };

  // CREATE NOTE
  Future<void> createNote() {
    return notesDb.add(note).then(
          (note) {},
          onError: (e) => print("Error: $e"),
        );
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
