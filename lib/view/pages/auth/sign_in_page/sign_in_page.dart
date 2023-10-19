import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/view/common_widgets/remove_glow_effect.dart';
import 'package:simple_notes/view/pages/home_page/home_page.dart';

import 'widgets/apple_sign_in_button.dart';
import 'widgets/email_text_field.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/password_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/sign_in_bg.jpg',
            fit: BoxFit.cover,
            height: sizeDevice.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RemoveGlowEffect(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 35),
                          //
                          const Icon(
                            Icons.sticky_note_2_outlined,
                            size: 100,
                          ),
                          //
                          const SizedBox(height: 26),
                          EmailSignInTextField(
                              label: 'Email', controller: emailController),
                          const SizedBox(height: 16),
                          PasswordSignInTextField(
                              label: 'Password',
                              isSecret: true,
                              controller: passwordController),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.rubik(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          ElevatedButton(
                            onPressed: () {
                              final formValid =
                                  formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: HomePage(),
                                  ),
                                );
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
                              'Sign In',
                              style: GoogleFonts.rubik(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () => (),
                            child: Text(
                              "Sign Up",
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
                                width: sizeDevice.width <= 380 ? 50 : 70,
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
                                width: sizeDevice.width <= 380 ? 50 : 70,
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
