import 'package:simple_notes/view/pages/home_page/home_page.dart';
import 'package:simple_notes/view/pages/note_page/note_page.dart';

import '../view/pages/create_note_page/create_note_page.dart';
import '../view/pages/edit_note_page/edit_note_page.dart';

final routes = {
  '/HomePage': (context) => HomePage(),
  '/NotePage': (context) => const NotePage(),
  '/EditNotePage': (context) => const EditNotePage(),
  '/CreateNotePage': (context) => const CreateNotePage(),
};
