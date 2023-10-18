class Note {
  final String? title;
  final String? note;
  final String? timestamp;
  final String? noteId;
  Note({
    this.title,
    this.note,
    this.timestamp,
    this.noteId,
  });

  factory Note.fromFirestore(
    Map<String, dynamic> map,
  ) {
    return Note(
      title: map['title'],
      note: map['note'],
      timestamp: map['timestamp'],
      noteId: map['noteId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'note': note,
      'timestamp': timestamp,
      'noteId': noteId,
    };
  }
}
