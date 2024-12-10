import 'package:flutter/material.dart';

class IdeaDescription extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const IdeaDescription({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
