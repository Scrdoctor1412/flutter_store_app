import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String?)? validator;

  const AuthField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        } else {
          return null;
        }
      },
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelText: labelText,
        labelStyle: GoogleFonts.getFont(
          'Nunito Sans',
          fontSize: 14,
          letterSpacing: 0.1,
        ),
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
