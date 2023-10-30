import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';

class FullscreenEmptyLibrary extends StatelessWidget {
  const FullscreenEmptyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Text(l10n.libraryEmptyMessage),
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
