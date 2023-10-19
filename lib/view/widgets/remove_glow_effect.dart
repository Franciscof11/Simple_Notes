import 'package:flutter/material.dart';

class RemoveGlowEffect extends StatelessWidget {
  const RemoveGlowEffect({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      child: child,
    );
  }
}
