import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FleetimeTextField extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final TextStyle? labelStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? alignLabelWithHint;
  final bool? readOnly;
  final String? suffixText;
  final bool? enabled;
  final void Function(String)? onSaved;
  final String? initialValue;

  const FleetimeTextField({
    Key? key,
    required this.name,
    this.controller,
    this.validator,
    required this.hintText,
    this.labelStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.autoValidateMode,
    this.keyboardType,
    this.maxLines,
    this.alignLabelWithHint,
    this.readOnly,
    this.suffixText,
    this.enabled,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      readOnly: readOnly ?? false,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: autoValidateMode,
      decoration: InputDecoration(
        alignLabelWithHint: alignLabelWithHint ?? false,
        labelStyle: labelStyle ??
            const TextStyle(
              fontSize: 18,
            ),
        hintText: hintText,
        filled: true,
        suffixText: suffixText ?? '',
        suffixStyle: const TextStyle(
          fontSize: 16,
        ),
        fillColor: Colors.grey.shade300,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
        enabledBorder: enabledBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
      ),
      maxLines: maxLines ?? 1,
      initialValue: initialValue,
    );
  }
}
