import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/view/pages/note_page/note_page.dart';

import '../../../../model/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child: NotePage(
              note: note,
            ),
          ),
        ), //
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectColor(note.cardColor!),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Text(
                  note.title ?? '',
                  style: GoogleFonts.notoSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  note.note ?? '',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color? selectColor(String color) {
  switch (color) {
    case 'yellow':
      return const Color.fromARGB(255, 247, 236, 152);
    case 'red':
      return const Color.fromARGB(255, 231, 99, 99);
    case 'green':
      return const Color.fromARGB(255, 144, 245, 141);
    case 'blue':
      return const Color.fromARGB(255, 132, 225, 231);
    case 'purple':
      return const Color.fromARGB(255, 160, 113, 204);
    case 'white':
      return Colors.white;
  }
  return null;
}
