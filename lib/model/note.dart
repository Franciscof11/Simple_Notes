import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String title;
  final String note;
  final DateTime timestamp;

  Note({
    required this.title,
    required this.note,
    required this.timestamp,
  });

  factory Note.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Note(
      title: data?['title'],
      note: data?['note'],
      timestamp: data?['timestamp'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {};
  }
}
