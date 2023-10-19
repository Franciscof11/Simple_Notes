import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/controller/notes_firestore_service.dart';

import '../../../model/note.dart';
import '../create_note_page/create_note_page.dart';
import 'widgets/note_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final notesFirestoreService = NotesFirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 45),
              //
              // App Bar
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notes',
                    style: GoogleFonts.notoSans(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: const CreateNotePage(),
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
                              Icons.grid_view_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: const CreateNotePage(),
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
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //
              // ListView Notes
              //
              StreamBuilder<List<Note>>(
                stream: notesFirestoreService.readNotes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Note> notes = snapshot.data!;

                    if (notes.isEmpty) {
                      return const Text(
                        'No Notes',
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.86,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: notes.length,
                          itemBuilder: (context, index) => NoteCard(
                            note: notes[index],
                          ),
                        ),
                      );
                    }
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
