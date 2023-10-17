// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class FirestoreService {
  final note = {
    'note': 'Bmw X6, Tracker Novo, Novo HRV',
    'title': 'Carros pra comprar',
    'timestamp': DateTime.now(),
  };

  // CREATE NOTE
  Future<void> createNote() {
    return db.collection('notes').add(note).then(
          (note) {},
        );
  }

  // DELETE NOTE
  Future<void> deleteNote(String noteId) {
    return db.collection('notes').doc(noteId).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }
}
