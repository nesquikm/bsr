import 'dart:async';

import 'package:bsr/features/common/common.dart';
import 'package:bsr/features/library/library.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'grouped_by_author_sorted_by_title.dart';
export 'sorted_by_title.dart';
export 'tome_list/tome_list.dart';

part 'tome_library_search.g.dart';
part 'tome_library_search.freezed.dart';

@freezed
sealed class TomeLibrarySearchData with _$TomeLibrarySearchData {
  const factory TomeLibrarySearchData.authors(String searchText) = _Authors;
  const factory TomeLibrarySearchData.titles(String searchText) = _Titles;
  const factory TomeLibrarySearchData.everywhere(String searchText) =
      _Everywhere;
}

@riverpod
Future<Map<String, CachedTome>> tomeLibrarySearch(
  TomeLibrarySearchRef ref,
  TomeLibrarySearchData data,
) async {
  await ref.debounceAndCancel();

  final tomeList = await ref.watch(tomeLibraryProvider.future);
  final searchIndex = await ref.watch(tomeLibrarySearchIndexProvider.future);

  final ids = switch (data) {
    _Authors(:final searchText) => filterSearchIndex(
        searchIndex.authorWords,
        searchText,
      ),
    _Titles(:final searchText) => filterSearchIndex(
        searchIndex.titleWords,
        searchText,
      ),
    _Everywhere(:final searchText) => {
        ...filterSearchIndex(
          searchIndex.authorWords,
          searchText,
        ),
        ...filterSearchIndex(
          searchIndex.titleWords,
          searchText,
        ),
      },
  };

  return Map.fromEntries(
    tomeList.entries.where(
      (element) => ids.contains(element.key),
    ),
  );
}
