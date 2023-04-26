import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class FleetimeOfficeSelectionDropdown extends StatelessWidget {
  final String name;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final IconData icon;
  final String hintText;
  final List<String> items;
  final InputDecoration dropdownSearchDecoration;

  const FleetimeOfficeSelectionDropdown({
    super.key,
    required this.name,
    this.onChanged,
    this.onSaved,
    required this.icon,
    required this.hintText,
    required this.items,
    required this.dropdownSearchDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderSearchableDropdown<String>(
      name: name,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: FormBuilderValidators.required(),
      dropdownSearchTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      items: items,
      popupProps: const PopupProps.menu(showSearchBox: true),
      dropdownSearchDecoration: dropdownSearchDecoration,
      filterFn: (provinsi, filter) =>
          provinsi.toLowerCase().contains(filter.toLowerCase()),
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
        fillColor: Colors.grey.shade300,
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
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
    );
  }
}
