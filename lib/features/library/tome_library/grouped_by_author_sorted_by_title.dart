import 'dart:async';
import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'tome_list/tome_list.dart';

part 'grouped_by_author_sorted_by_title.g.dart';

@riverpod
Future<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>
    tomeLibraryGroupedByAuthorAndSortedByTitle(
  TomeLibraryGroupedByAuthorAndSortedByTitleRef ref,
  TomeLibrarySearchData data,
) async {
  final tomeList = await ref.watch(tomeLibrarySearchProvider(data).future);
  final result = SplayTreeMap<String, LinkedHashMap<String, CachedTome>>(
    (a, b) => a.compareTo(b),
  );

  for (final tome in tomeList.entries) {
    final author = tome.value.tomeInfo.author ?? '';

    final authorTomeList = result[author] ?? <String, CachedTome>{}
      ..addAll({tome.key: tome.value});

    result[author] = TomeLibrary.getSortedByTitle(authorTomeList);
  }

  return result;
}
