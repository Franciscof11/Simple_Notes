import 'package:flutter/material.dart';

class CreateFormField extends StatefulWidget {
  final String hint;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  const CreateFormField({
    super.key,
    required this.hint,
    this.controller,
    this.hintStyle,
  });

  @override
  State<CreateFormField> createState() => _CreateFormFieldState();
}

class _CreateFormFieldState extends State<CreateFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo Invalido!';
        }
        return null;
      },
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
