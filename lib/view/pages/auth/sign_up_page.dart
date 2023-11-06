import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/view/common_widgets/remove_glow_effect.dart';
import 'package:simple_notes/view/pages/auth/widgets/email_text_field.dart';

import '../../../controller/auth/sign_up.dart';
import 'sign_in_page.dart';
import 'widgets/password_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ImagePicker imagePicker = ImagePicker();
  final formsignUpKey = GlobalKey<FormState>();
  final emailSignUpController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final confirmPassword = TextEditingController();

  File? imageFile;

  pickImage({required ImageSource source}) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
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
                          const SizedBox(height: 20),
                          Text(
                            "Let's create an account for you",
                            style: GoogleFonts.rubik(
                              color: Colors.grey[600],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 26),
                          Stack(
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: CircleAvatar(
                                  backgroundImage: imageFile != null
                                      ? FileImage(imageFile!)
                                      : const NetworkImage(
                                          'https://cdn.icon-icons.com/icons2/2406/PNG/512/user_account_icon_145918.png',
                                        ) as ImageProvider,
                                  backgroundColor: Colors.grey[350],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 20,
                                child: GestureDetector(
                                  onTap: () => showPhotoOptions(),
                                  child: Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.photo_camera_outlined,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                              formsignUpKey.currentState?.validate();

                              if (passwordSignUpController.text ==
                                  confirmPassword.text) {
                                createUser(
                                  email: emailSignUpController.text,
                                  password: passwordSignUpController.text,
                                  context: context,
                                );
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
                          const SizedBox(height: 50),
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

  void showPhotoOptions() {
    showModalBottomSheet(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(70),
        topLeft: Radius.circular(70),
      )),
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(source: ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.photo_library_outlined, size: 30),
                      const SizedBox(width: 12),
                      Text(
                        'Gallery',
                        style: GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(source: ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.camera_alt_outlined, size: 30),
                      const SizedBox(width: 12),
                      Text(
                        'Camera',
                        style: GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      imageFile = null;
                    });
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline, size: 30),
                      const SizedBox(width: 12),
                      Text(
                        'Remove',
                        style: GoogleFonts.notoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
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
