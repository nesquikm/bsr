import 'dart:collection';

import 'package:bsr/features/common/common.dart';
import 'package:bsr/features/library/library.dart';
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

    final result = ref.watch(
      tomeLibraryGroupedByAuthorAndSortedByTitleProvider,
    );

    final slivers = switch (result) {
      AsyncValue<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>(
        :final valueOrNull?,
      ) =>
        valueOrNull.entries.isEmpty
            ? const FullscreenEmptyLibrarySliver()
            : AuthorTomesSliver(authorTomes: valueOrNull.entries, ref: ref),
      AsyncValue(
        :final error?,
      ) =>
        FullscreenErrorMessageSliver(
          text: 'Error loading library $error',
        ),
      _ => const FullscreenProgressIndicatorSliver(),
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(l10n.counterAppBarTitle),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          slivers,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFile(
            ref: ref,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
