import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/view/pages/note_page/note_page.dart';

import '../../../../model/note.dart';
import 'expansive_button.dart';

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
            color: Colors.white,
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
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: ExpandibleButton(note: note),
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
