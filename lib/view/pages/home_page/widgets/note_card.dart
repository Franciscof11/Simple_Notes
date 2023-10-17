import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        color: Colors.white,
        child: const Column(
          children: [
            Text('Alo'),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
