class Note {
  final String? title;
  final String? note;
  final String? timestamp;
  final String? noteId;
  final String? cardColor;
  Note({
    this.title,
    this.note,
    this.timestamp,
    this.noteId,
    this.cardColor,
  });

  factory Note.fromFirestore(
    Map<String, dynamic> map,
  ) {
    return Note(
      title: map['title'],
      note: map['note'],
      timestamp: map['timestamp'],
      noteId: map['noteId'],
      cardColor: map['cardColor'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'note': note,
      'timestamp': timestamp,
      'noteId': noteId,
      'cardColor': cardColor,
    };
  }
}
