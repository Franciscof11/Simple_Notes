// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/note.dart';
import '../../view/common_widgets/toast.dart';

final notesDb = FirebaseFirestore.instance.collection('notes');
final user = FirebaseAuth.instance.currentUser;
final userId = user!.uid;

class NotesFirestoreService {
  // CREATE NOTE
  Future<void> createNote(
    String title,
    String note,
    String color,
    String userId,
    BuildContext context,
  ) async {
    try {
      final docNote = notesDb.doc();
      final noteObject = Note(
        noteId: docNote.id,
        title: title,
        note: note,
        cardColor: color,
        userId: userId,
        timestamp: DateTime.now().toString(),
      ).toFirestore();

      await docNote.set(noteObject);
    } catch (e) {
      if (context.mounted) Navigator.pop(context);
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
      if (context.mounted) showToast(context, message: 'Note Deleted!');
    } catch (e) {
      if (context.mounted) showToast(context, message: 'Error deleting note!');
    }
  }

  // UPDATE NOTE
  Future<void> updateNote(
      {required Note updatedNote, required Note oldnote}) async {
    try {
      final noteAtt = updatedNote.toFirestore();

      return notesDb.doc(oldnote.noteId).update(noteAtt);
    } catch (e) {
      print('erro -> $e');
    }
  }

  // READ ALL NOTES
  Stream<List<Note>> readNotes() {
    return notesDb
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
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
