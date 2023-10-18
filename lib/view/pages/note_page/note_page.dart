import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../model/note.dart';
import '../edit_note_page/edit_note_page.dart';

class NotePage extends StatefulWidget {
  final Note? note;
  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 45, left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: const Icon(
                              Icons.spatial_audio_off_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: EditNotePage(
                                note: widget.note,
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: const Icon(
                              Icons.mode_edit_outline_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 30, left: 22, right: 22, top: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),
                          Text(
                            widget.note?.title ?? '',
                            style: GoogleFonts.notoSans(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            widget.note?.note ?? '',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.notoSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
