import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';

class FullscreenEmptyLibrary extends StatelessWidget {
  const FullscreenEmptyLibrary({required this.isSearching, super.key});

  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final text =
        isSearching ? l10n.libraryEmptySearchMessage : l10n.libraryEmptyMessage;
    return Center(
      child: Text(text),
    );
  }
}

class FullscreenEmptyLibrarySliver extends StatelessWidget {
  const FullscreenEmptyLibrarySliver({required this.isSearching, super.key});

  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: FullscreenEmptyLibrary(
        isSearching: isSearching,
      ),
    );
  }
}
