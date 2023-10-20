import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/view/common_widgets/remove_glow_effect.dart';
import 'package:simple_notes/view/pages/auth/widgets/email_text_field.dart';

import 'sign_in_page.dart';
import 'widgets/apple_sign_in_button.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/password_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formsignUpKey = GlobalKey<FormState>();
  final emailSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final confirmPassword = TextEditingController();

  get type => null;
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Image.asset(
            'assets/sign_in_bg.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Form(
                key: formsignUpKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RemoveGlowEffect(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          //
                          const Icon(
                            Icons.sticky_note_2_outlined,
                            size: 100,
                          ),
                          //
                          const SizedBox(height: 26),
                          Text(
                            "Let's create an account for you",
                            style: GoogleFonts.rubik(
                              color: Colors.grey[600],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 26),
                          EmailSignInTextField(
                            label: 'Email',
                            controller: emailSignUpController,
                          ),
                          const SizedBox(height: 16),
                          PasswordSignInTextField(
                            label: 'Password',
                            isSecret: true,
                            controller: passwordSignUpController,
                          ),
                          const SizedBox(height: 16),
                          PasswordSignInTextField(
                            label: 'Confirm password',
                            isSecret: true,
                            controller: confirmPassword,
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              final formValid =
                                  formsignUpKey.currentState?.validate() ??
                                      false;
                              if (formValid) {
                                if (passwordSignUpController.text ==
                                    confirmPassword.text) {
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 60, vertical: 240),
                                      child: Card(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Passwords dont match!',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 40),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                ),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text(
                                                  'OK',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 80),
                              backgroundColor: Colors.black,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.rubik(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                PageTransition(
                                  child: const SignInPage(),
                                  type: PageTransitionType.leftToRight,
                                )),
                            child: Text(
                              "Already have an account?",
                              style: GoogleFonts.rubik(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: widthDevice <= 380 ? 50 : 70,
                                child: Divider(
                                  color: Colors.grey[600],
                                  thickness: 0.5,
                                ),
                              ),
                              Text(
                                "Or continue with",
                                style: GoogleFonts.rubik(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                width: widthDevice <= 380 ? 50 : 70,
                                child: Divider(
                                  color: Colors.grey[600],
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GoogleSignInButton(
                                urlImage: 'assets/google.png',
                              ),
                              SizedBox(width: 24),
                              AplleSignInButton(
                                urlImage: 'assets/apple.png',
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
