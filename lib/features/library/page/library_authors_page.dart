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
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _searchQuery = _searchController.text;
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final result = ref.watch(
      tomeLibraryGroupedByAuthorAndSortedByTitleProvider(
        TomeLibrarySearchData.authors(_searchQuery),
      ),
    );

    final data = result.when(
      data: (SplayTreeMap<String, LinkedHashMap<String, CachedTome>> data) {
        return data.entries.isEmpty
            ? FullscreenEmptyLibrarySliver(
                isSearching: _searchQuery.isNotEmpty,
              )
            : AuthorTomesSliver(
                authorTomes: data.entries,
                ref: ref,
              );
      },
      error: (Object error, StackTrace stackTrace) {
        return FullscreenErrorMessageSliver(
          text: l10n.errorLoadingLibraryMessage(error.toString()),
        );
      },
      loading: () {
        return const FullscreenProgressIndicatorSliver();
      },
    );

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
