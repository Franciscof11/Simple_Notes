import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_notes/controller/notes_controller.dart';

import '../../../model/note.dart';
import 'widgets/edit_text_form_field.dart';

class EditNotePage extends StatefulWidget {
  final Note? note;
  const EditNotePage({super.key, this.note});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final titleAttController = TextEditingController();
  final noteAttController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
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
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
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
                              Icons.color_lens_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            final Note noteAtt = Note(
                              title: titleAttController.text.isEmpty
                                  ? widget.note!.title
                                  : titleAttController.text,
                              note: noteAttController.text.isEmpty
                                  ? widget.note!.note
                                  : noteAttController.text,
                              noteId: widget.note!.noteId,
                              timestamp: DateTime.now().toString(),
                            );
                            updateNote(
                              updatedNote: noteAtt,
                              oldnote: widget.note!,
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: const Icon(
                              Icons.done_rounded,
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 18),
                            EditFormField(
                              controller: titleAttController,
                              hint: widget.note?.title ?? '',
                              hintStyle: GoogleFonts.notoSans(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            EditFormField(
                              controller: noteAttController,
                              hint: widget.note?.note ?? '',
                              hintStyle: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
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
