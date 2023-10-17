import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_notes/controller/notes_firestore_service.dart';

import '../../../model/note.dart';
import 'widgets/create_note_card.dart';
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
        child: Column(
          children: [
            const SizedBox(height: 40),
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
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => const Dialog(
                        child: CreateNoteCard(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
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
                )
              ],
            ),

            //
            // ListView Notes
            //
            StreamBuilder<List<Note>>(
              stream: notesFirestoreService.readNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List notes = snapshot.data!;

                  if (notes.isEmpty) {
                    return const Text(
                      'No Notes',
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: notes.length,
                      itemBuilder: (context, index) => NoteCard(
                        title: notes[index].title ?? '',
                        note: notes[index].note ?? '',
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
    );
  }
}
