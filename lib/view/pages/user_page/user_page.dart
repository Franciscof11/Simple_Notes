import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_notes/controller/user/user_controller.dart';
import 'package:simple_notes/view/pages/auth/sign_in_page.dart';

import '../../../controller/auth/sign_out.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final hasImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 45),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile',
                style: GoogleFonts.notoSans(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 65),
            Stack(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    foregroundImage: hasImage
                        ? const NetworkImage(
                            'https://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/1966.png',
                          )
                        : const NetworkImage(
                            'https://cdn.icon-icons.com/icons2/2406/PNG/512/user_account_icon_145918.png',
                          ),
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      pickPhoto(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Lebron James',
              style: GoogleFonts.notoSans(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'lebronhajames@gmail.com',
              style: GoogleFonts.notoSans(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: GestureDetector(
                onTap: () => {
                  signOut(),
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const SignInPage(),
                    ),
                  ),
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Logout',
                        style: GoogleFonts.notoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

pickPhoto(context) {
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
                  pegarImagemGaleria();
                  Navigator.pop(context);
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
                  pegarImagemCamera();
                  Navigator.pop(context);
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
                onTap: () => print('removido'),
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
