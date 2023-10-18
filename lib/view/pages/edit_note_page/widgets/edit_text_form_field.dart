import 'package:flutter/material.dart';

class EditFormField extends StatefulWidget {
  final String hint;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  const EditFormField({
    super.key,
    required this.hint,
    this.controller,
    this.hintStyle,
  });

  @override
  State<EditFormField> createState() => _EditFormFieldState();
}

class _EditFormFieldState extends State<EditFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      maxLines: null,
      cursorColor: Colors.black,
      controller: widget.controller,
      style: widget.hintStyle,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
