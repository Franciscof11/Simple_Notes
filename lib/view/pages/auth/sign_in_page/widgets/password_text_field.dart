import 'package:flutter/material.dart';

class PasswordSignInTextField extends StatefulWidget {
  final String label;
  final Widget? prefixIcon;
  final bool isSecret;
  final TextEditingController? controller;
  const PasswordSignInTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.isSecret = false,
    this.controller,
  });

  @override
  State<PasswordSignInTextField> createState() =>
      _PasswordSignInTextFieldState();
}

class _PasswordSignInTextFieldState extends State<PasswordSignInTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 16,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required field!';
        }

        return null;
      },
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 23, horizontal: 15),
        suffixIconColor: Colors.grey[500],
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.grey[200],
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.6,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
        labelText: widget.label,
        suffixIcon: widget.isSecret
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
