class Note {
  final String? title;
  final String? note;
  final String? timestamp;
  final String? noteId;
  final String? cardColor;
  final String? userId;
  Note({
    this.title,
    this.note,
    this.timestamp,
    this.noteId,
    this.cardColor,
    this.userId,
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
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'note': note,
      'timestamp': timestamp,
      'noteId': noteId,
      'cardColor': cardColor,
      'userId': userId,
    };
  }
}
