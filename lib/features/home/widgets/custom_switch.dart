import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });
  final bool value;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Branded short link',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 40.0,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: value,
              activeColor: Colors.orange,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
