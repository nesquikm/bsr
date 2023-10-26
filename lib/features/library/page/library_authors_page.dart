import 'package:bsr/app/router/router.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryAuthorsPage extends ConsumerStatefulWidget {
  const LibraryAuthorsPage({super.key});

  @override
  ConsumerState<LibraryAuthorsPage> createState() => _LibraryAuthorsPageState();
}

class _LibraryAuthorsPageState extends ConsumerState<LibraryAuthorsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('LibraryAuthors'),
          TextButton(
            onPressed: () {
              ref.goFurther(AppRoute.reader);
            },
            child: const Text('Reader'),
          ),
          TextButton(
            onPressed: () {
              ref.goFurther(AppRoute.settings);
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
