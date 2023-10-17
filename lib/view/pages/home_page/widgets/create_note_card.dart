import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/notes_firestore_service.dart';
import '../../../widgets/toast.dart';
import 'note_form_field.dart';

class CreateNoteCard extends StatelessWidget {
  const CreateNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleNoteController = TextEditingController();
    final noteTextController = TextEditingController();
    final notesFirestoreService = NotesFirestoreService();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text('Criar Nota'),
                  const SizedBox(height: 40),
                  NoteFormField(
                      label: 'Title', controller: titleNoteController),
                  const SizedBox(height: 25),
                  NoteFormField(label: 'Note', controller: noteTextController),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      final formValid =
                          formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        notesFirestoreService.createNote(
                          titleNoteController.text,
                          noteTextController.text,
                          context,
                        );
                      }
                      context.pop();

                      showToast(context, message: 'Note Created!');
                    },
                    child: const Text('Create Note'),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
