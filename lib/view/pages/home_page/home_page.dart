import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/firestore_service.dart';
import 'widgets/create_note_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirestoreService();
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
            //
            //
          ],
        ),
      ),
    );
  }
}
