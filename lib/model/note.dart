class Note {
  final String? title;
  final String? note;
  final String? timestamp;

  Note({
    required this.title,
    required this.note,
    required this.timestamp,
  });

  factory Note.fromFirestore(
    Map<String, dynamic> map,
  ) {
    return Note(
      title: map['title'],
      note: map['note'],
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'note': note,
      'timestamp': timestamp,
    };
  }
}
