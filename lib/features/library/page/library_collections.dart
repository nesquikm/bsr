import 'package:bsr/app/router/router.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryCollectionsPage extends ConsumerStatefulWidget {
  const LibraryCollectionsPage({super.key});

  @override
  ConsumerState<LibraryCollectionsPage> createState() =>
      _LibraryCollectionsPageState();
}

class _LibraryCollectionsPageState
    extends ConsumerState<LibraryCollectionsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('LibraryCollections'),
          TextButton(
            onPressed: () {
              ref.goFurther(AppRoute.reader.path);
            },
            child: const Text('Reader'),
          ),
          TextButton(
            onPressed: () {
              ref.goFurther(AppRoute.settings.path);
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
