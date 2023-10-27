import 'package:flutter/material.dart';

class FullscreenProgressIndicator extends StatelessWidget {
  const FullscreenProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class FullscreenProgressIndicatorSliver extends StatelessWidget {
  const FullscreenProgressIndicatorSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: FullscreenProgressIndicator(),
    );
  }
}
