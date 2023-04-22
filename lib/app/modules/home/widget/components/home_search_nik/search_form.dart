// 🐦 Flutter imports:
import 'package:akm/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class NikSearchForm extends StatelessWidget {
  const NikSearchForm({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: FormBuilderTextField(
        name: 'nik',
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // add custom google font
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        // onEditingComplete: () {
        //   controller.searchNik(controller.nik.text);
        // },
        controller: controller.nik,
        cursorColor: Colors.black,
        cursorHeight: 20,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: const Icon(
            Icons.numbers_outlined,
            color: Colors.black,
            size: 25,
          ),
          // suffixIcon: IconButton(
          //   onPressed: () {
          //     controller.searchNik(controller.nik.text);
          //   },
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.black,
          //     size: 25,
          //   ),
          // ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 25,
          ),
          focusColor: Colors.red,
          fillColor: Colors.grey.shade400,
          hoverColor: Colors.red,
          filled: true,
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
          hintText: 'Masukkan NIK',
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            // add custom google font
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
