import 'package:flutter/material.dart';

import 'note_form_field.dart';

class CreateNoteCard extends StatelessWidget {
  const CreateNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text('Criar Nota'),
                const SizedBox(height: 40),
                const NoteFormField(label: 'Title'),
                const SizedBox(height: 25),
                const NoteFormField(label: 'Note'),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Create Note'),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
