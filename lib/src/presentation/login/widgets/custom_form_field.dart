// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/design/design.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.label,
    this.controller,
    required this.validator,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
    this.focusNode,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final IconData icon;
  final bool obscureText;
  final Function(String)? onSubmitted;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  InputBorder get border => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          onFieldSubmitted: onSubmitted,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              color: AppColors.yellow,
              fontSize: 14,
            ),
            fillColor: AppColors.white,
            filled: true,
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: const BorderSide(
                color: AppColors.green,
              ),
            ),
            prefixIcon: Icon(
              icon,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
