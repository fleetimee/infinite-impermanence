import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class FleetimeSearchableDropdown extends StatelessWidget {
  final String name;
  final String initialValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final List<String> items;
  final bool Function(String, String) filterFn;
  final FormFieldValidator<String>? validator;

  const FleetimeSearchableDropdown({
    Key? key,
    required this.initialValue,
    required this.name,
    this.onChanged,
    this.onSaved,
    required this.items,
    required this.filterFn,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderSearchableDropdown<String>(
      key: Key(name),
      name: name,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      items: items,
      filterFn: filterFn,
      dropdownSearchTextStyle: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          fontSize: 18,
        ),
        filled: true,
        fillColor: Colors.grey.shade400,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
