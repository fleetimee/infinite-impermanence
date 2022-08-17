// 🐦 Flutter imports:
import 'package:flutter/material.dart';

Widget inputForm(
  BuildContext context,
  String label,
  String hintText,
  Widget suffixIcon,
  TextInputType keyboardType,
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 18),
      hintText: hintText,
      suffixIcon: suffixIcon,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
    keyboardType: keyboardType,
    validator: (String? value) {
      if (value!.isEmpty) {
        return 'Harap isi $label';
      }
      return null;
    },
  );
}

Widget inputFormWithValidator(
  BuildContext context,
  String label,
  String hintText,
  Widget suffixIcon,
  TextInputType keyboardType,
  TextEditingController controller,
  String validator,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 18),
      hintText: hintText,
      suffixIcon: suffixIcon,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
    keyboardType: keyboardType,
    validator: (String? value) {
      if (value!.isEmpty) {
        return validator;
      }
      return null;
    },
  );
}
