import 'dart:async';

import 'package:bsr/features/library/library.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'grouped_by_author_sorted_by_title.dart';
export 'sorted_by_title.dart';
export 'tome_list/tome_list.dart';

part 'tome_library_tome.g.dart';

@riverpod
Future<CachedTome> tomeLibraryTome(
  TomeLibraryTomeRef ref,
  String id,
) async {
  final tomeList = await ref.watch(tomeLibraryProvider.future);

  final tome = tomeList[id];

  if (tome == null) {
    throw StateError('Tome $id not found');
  }

  return tome;
}
