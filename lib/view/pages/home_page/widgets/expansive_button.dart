import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../controller/notes_controller.dart';
import '../../../../model/note.dart';
import '../../edit_note_page/edit_note_page.dart';

class ExpandibleButton extends StatefulWidget {
  final Note note;
  const ExpandibleButton({super.key, required this.note});

  @override
  State<ExpandibleButton> createState() => _ExpandibleButtonState();
}

class _ExpandibleButtonState extends State<ExpandibleButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          left: 20.0,
          bottom: 0.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: ExpandableMenu(
              width: 40.0,
              height: 40.0,
              backgroundColor: Colors.yellow[400]!,
              iconColor: Colors.black,
              itemContainerColor: Colors.white.withOpacity(0.5),
              items: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: EditNotePage(
                          note: widget.note,
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.mode_edit_outline_outlined,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.copy,
                  color: Colors.black,
                  size: 23,
                ),
                GestureDetector(
                  onTap: () => deleteNote(context, widget.note.noteId ?? ''),
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.share_rounded,
                  color: Colors.black,
                  size: 23,
                ),
              ],
            )),
      ],
    );
  }
}
