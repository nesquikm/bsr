import 'dart:async';
import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'tome_list/tome_list.dart';

part 'sorted_by_title.g.dart';

@riverpod
Future<LinkedHashMap<String, CachedTome>> tomeLibrarySortedByTitle(
  TomeLibrarySortedByTitleRef ref,
) async {
  return TomeLibrary.getSortedByTitle(
    await ref.watch(
      tomeLibraryProvider.future,
    ),
  );
}
