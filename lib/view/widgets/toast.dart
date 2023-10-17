import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

showToast(context, String message) {
  Flushbar(
    message: message,
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.blue[300],
    ),
    margin: const EdgeInsets.only(top: 40, right: 60),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: Colors.blue[300],
    flushbarPosition: FlushbarPosition.TOP,
    forwardAnimationCurve: Curves.decelerate,
    animationDuration: const Duration(seconds: 1),
    backgroundColor: Colors.white,
  ).show(context);
}
