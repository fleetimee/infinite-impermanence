import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FilterTextFieldForm extends StatelessWidget {
  final String name;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool enabled;
  final String? Function(String?)? validator;

  const FilterTextFieldForm({
    super.key,
    required this.name,
    required this.keyboardType,
    required this.controller,
    required this.prefixIcon,
    required this.enabled,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
    );
  }
}
