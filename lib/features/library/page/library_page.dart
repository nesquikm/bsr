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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Tomes', //context.l10n.libraryTomes,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Autors', //context.l10n.libraryAuthors,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collections', //,context.l10n.libraryCollections,
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
