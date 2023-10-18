import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'expansive_button.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String note;
  final String noteId;
  const NoteCard({
    super.key,
    required this.title,
    required this.note,
    required this.noteId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onLongPress: () => print('rapa'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  note,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: ExpandibleButton(noteId: noteId),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
