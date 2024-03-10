import 'package:flutter/material.dart';
import 'package:furni_move/view/constants/app_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.onChanged,
      this.controller,
      this.keyboardType,
      this.validator,
      required this.radius});
  final TextInputType? keyboardType;
  final double radius;
  final String labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppTheme.blackText),
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none,
            ),
            labelText: labelText,
            fillColor: AppTheme.lightGrey.withOpacity(0.15),
            filled: true,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppTheme.blackText)),
      ),
    );
  }
}
