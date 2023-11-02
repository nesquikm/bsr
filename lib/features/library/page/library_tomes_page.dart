import 'dart:collection';

import 'package:bsr/features/common/common.dart';
import 'package:bsr/features/library/library.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryTomesPage extends ConsumerStatefulWidget {
  const LibraryTomesPage({super.key});

  @override
  ConsumerState<LibraryTomesPage> createState() => _LibraryTomesPageState();
}

class _LibraryTomesPageState extends ConsumerState<LibraryTomesPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final result = ref.watch(
      tomeLibrarySortedByTitleProvider,
    );

    final data = switch (result) {
      AsyncValue<LinkedHashMap<String, CachedTome>>(
        :final valueOrNull?,
      ) =>
        valueOrNull.entries.isEmpty
            ? const FullscreenEmptyLibrarySliver()
            : TomesSliver(
                tomes: valueOrNull.values,
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
              hintText: l10n.libraryTomesSearchBarHintText,
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
