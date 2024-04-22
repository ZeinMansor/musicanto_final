import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final controller;
  final fieldLable;
  final validationErrorMessage;
  final bool obsecureText;
  final Widget? icon;
  const CustomeTextField(
      {super.key,
      required this.controller,
      required this.fieldLable,
      required this.obsecureText,
      required this.icon,
      required this.validationErrorMessage});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          suffixIcon: icon,
          labelText: fieldLable,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      validator: (value) => value!.isEmpty ? validationErrorMessage : null,
    );
  }
}
