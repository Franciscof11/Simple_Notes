import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../view/pages/auth/sign_in_page.dart';
import '../../view/pages/home_page/home_page.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Escuta se o user está logado ou não
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // usuário logado
        if (snapshot.hasData) {
          return HomePage();
        }
        // usuário não está  logado
        else {
          return const SignInPage();
        }
      },
    );
  }
}
