import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/material.dart';

class ExpandibleButton extends StatelessWidget {
  const ExpandibleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          right: 20.0,
          left: 20.0,
          bottom: 0.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: ExpandableMenu(
              width: 40.0,
              height: 40.0,
              backgroundColor: Colors.yellow[300]!,
              iconColor: Colors.black,
              itemContainerColor: Colors.white.withOpacity(0.5),
              items: const [
                Icon(
                  Icons.mode_edit_outline_outlined,
                  color: Colors.black,
                ),
                Icon(
                  Icons.color_lens_outlined,
                  color: Colors.black,
                ),
                Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.black,
                ),
                Icon(
                  Icons.share_rounded,
                  color: Colors.black,
                ),
              ],
            )),
      ],
    );
  }
}
