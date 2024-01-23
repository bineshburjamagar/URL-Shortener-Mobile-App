import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
  });
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
        ],
        TextFormField(
          cursorHeight: 20.0,
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
