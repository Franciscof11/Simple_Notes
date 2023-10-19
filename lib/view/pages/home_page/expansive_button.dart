import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/model/note.dart';
import 'package:simple_notes/view/pages/edit_note_page/edit_note_page.dart';

import '../../../controller/notes_firestore_service.dart';

class ExpansiveButton extends StatefulWidget {
  final Note note;

  const ExpansiveButton({super.key, required this.note});
  @override
  State<ExpansiveButton> createState() => _ExpansiveButtonState();
}

class _ExpansiveButtonState extends State<ExpansiveButton> {
  bool isExpanded = false;
  final notesFirestoreService = NotesFirestoreService();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: isExpanded ? 110.0 : 35.0,
      height: 35.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isExpanded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 22,
                      ),
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        notesFirestoreService.deleteNote(
                            widget.note.noteId!, context);
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: const Icon(Icons.delete_outline_outlined),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: EditNotePage(
                              note: widget.note,
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.edit_outlined),
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.only(right: isExpanded ? 25 : 5),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
