import "package:flutter/material.dart";

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? isPassword;
  final Function(String)? onChanged;

  const TextFieldWithLabel({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          obscureText: isPassword ?? false,
          enableSuggestions: !(isPassword ?? false),
          autocorrect: !(isPassword ?? false),
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
