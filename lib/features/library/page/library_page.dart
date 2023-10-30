import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: context.l10n.libraryTomesAppBarTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: context.l10n.libraryAuthorsAppBarTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.collections),
            label: context.l10n.libraryCollectionsAppBarTitle,
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
