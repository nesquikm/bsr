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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final result = ref.watch(
      tomeLibraryGroupedByAuthorAndSortedByTitleProvider,
    );

    final data = switch (result) {
      AsyncValue<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>(
        :final valueOrNull?,
      ) =>
        valueOrNull.entries.isEmpty
            ? const FullscreenEmptyLibrarySliver()
            : AuthorTomesSliver(
                authorTomes: valueOrNull.entries,
                ref: ref,
              ),
      AsyncValue(
        :final error?,
      ) =>
        FullscreenErrorMessageSliver(
          text: l10n.errorLoadingLibraryMessage(error.toString()),
        ),
      _ => const FullscreenProgressIndicatorSliver(),
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: SearchBarView(
              hintText: l10n.libraryAuthorsSearchBarHintText,
              controller: _searchController,
            ),
          ),
          data,
          const FabAvoidingBottomPadding(),
        ],
      ),
      floatingActionButton: addFABButton(ref: ref),
    );
  }
}
