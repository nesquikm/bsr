import 'dart:async';

import 'package:bsr/features/library/library.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'grouped_by_author_sorted_by_title.dart';
export 'sorted_by_title.dart';
export 'tome_list/tome_list.dart';

part 'tome_library_tome_content.g.dart';

@riverpod
Future<TomeContent> tomeLibraryTomeContent(
  TomeLibraryTomeContentRef ref,
  String id,
) async {
  final tome = await ref.watch(tomeLibraryTomeProvider(id).future);

  return tome.content;
}
