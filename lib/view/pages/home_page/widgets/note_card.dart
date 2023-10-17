import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String note;
  const NoteCard({
    super.key,
    required this.title,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(title),
            const SizedBox(height: 25),
            Text(note),
          ],
        ),
      ),
    );
  }
}
