import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class FleetimeLoginTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;

  const FleetimeLoginTextField({
    super.key,
    required this.name,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.validator,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      enableSuggestions: true,
      autocorrect: true,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      controller: controller,
      cursorColor: primaryColor,
      cursorHeight: 20,
      textInputAction: TextInputAction.next,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: Icon(
          icon,
          color: Colors.black,
          size: 25,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        focusColor: Colors.red,
        fillColor: Colors.grey.shade400,
        hoverColor: Colors.red,
        filled: true,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black45),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // add custom google font
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
    );
  }
}
