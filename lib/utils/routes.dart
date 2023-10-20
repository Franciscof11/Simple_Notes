import 'package:simple_notes/view/pages/home_page/home_page.dart';
import 'package:simple_notes/view/pages/note_page/note_page.dart';

import '../controller/auth/auth_controller.dart';
import '../view/pages/auth/sign_in_page.dart';
import '../view/pages/auth/sign_up_page.dart';
import '../view/pages/create_note_page/create_note_page.dart';
import '../view/pages/edit_note_page/edit_note_page.dart';

final routes = {
  '/AuthController': (context) => const AuthController(),
  '/SignInPage': (context) => const SignInPage(),
  '/SignUpPage': (context) => const SignUpPage(),
  '/HomePage': (context) => HomePage(),
  '/NotePage': (context) => const NotePage(),
  '/EditNotePage': (context) => const EditNotePage(),
  '/CreateNotePage': (context) => const CreateNotePage(),
};
