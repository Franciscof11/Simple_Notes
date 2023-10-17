import 'package:flutter/material.dart';

class NoteFormField extends StatefulWidget {
  final String label;
  final Widget? prefixIcon;
  final bool isSecret;
  final TextEditingController? controller;
  const NoteFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.isSecret = false,
    this.controller,
  });

  @override
  State<NoteFormField> createState() => _NoteFormFieldState();
}

class _NoteFormFieldState extends State<NoteFormField> {
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
      style: const TextStyle(fontSize: 16),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo Invalido!';
        }
        return null;
      },
      decoration: InputDecoration(
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
        floatingLabelStyle: const TextStyle(fontSize: 20),
        prefixIcon: widget.prefixIcon,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
