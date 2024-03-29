import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.hasValidator = false,
    required this.controller,
  });
  final String? hintText;
  final String? labelText;
  final bool hasValidator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty) ...[
          Text(
            labelText!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
        ],
        TextFormField(
          cursorHeight: 20.0,
          validator: hasValidator
              ? (value) {
                  if (value != null && value.isEmpty) {
                    return 'This is required field.';
                  }
                  return null;
                }
              : null,
          controller: controller,
          cursorColor: Colors.amber,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
