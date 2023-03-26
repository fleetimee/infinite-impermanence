import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FleetimeDatePicker extends StatelessWidget {
  final String name;
  final DateTime? initialValue;
  final void Function(DateTime?)? onChanged;
  final String? errorFormatText;
  final String? errorInvalidText;
  final InputType? inputType;
  final DateFormat? format;
  final String hintText;

  const FleetimeDatePicker({
    super.key,
    required this.name,
    this.initialValue,
    this.onChanged,
    this.errorFormatText,
    this.errorInvalidText,
    this.inputType,
    this.format,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      initialValue: initialValue ?? DateTime.now(),
      onChanged: onChanged,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      inputType: inputType ?? InputType.date,
      format: format ?? DateFormat('dd-MM-yyyy'),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade400,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
