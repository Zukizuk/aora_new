import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  bool obscureText;
  final bool isPasswordField;
  String errorMessage;
  CustomTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.obscureText = false,
      this.isPasswordField = false,
      this.errorMessage = ''});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                color: AppColors.accent,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          // border radius
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          validator: (value) => value!.isEmpty ? widget.errorMessage : null,
          decoration: InputDecoration(
            fillColor: AppColors.field,
            filled: true,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: AppColors.hint,
              fontSize: 16,
            ),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon: Icon(
                      widget.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.hint,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.border,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
