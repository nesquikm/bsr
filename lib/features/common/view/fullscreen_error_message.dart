import 'package:flutter/material.dart';

class FullscreenErrorMessage extends StatelessWidget {
  const FullscreenErrorMessage({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
