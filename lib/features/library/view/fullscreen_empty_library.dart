import 'package:flutter/material.dart';

class FullscreenEmptyLibrary extends StatelessWidget {
  const FullscreenEmptyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Library is empty'),
    );
  }
}

class FullscreenEmptyLibrarySliver extends StatelessWidget {
  const FullscreenEmptyLibrarySliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: FullscreenEmptyLibrary(),
    );
  }
}
