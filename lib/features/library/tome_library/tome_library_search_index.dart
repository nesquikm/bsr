import 'dart:async';

import 'package:bsr/features/library/library.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'grouped_by_author_sorted_by_title.dart';
export 'sorted_by_title.dart';
export 'tome_list/tome_list.dart';

part 'tome_library_search_index.g.dart';
part 'tome_library_search_index.freezed.dart';

@freezed
sealed class TomeLibrarySearchIndexData with _$TomeLibrarySearchIndexData {
  const factory TomeLibrarySearchIndexData({
    required Map<String, Set<String>> authorWords,
    required Map<String, Set<String>> titleWords,
  }) = _TomeLibrarySearchIndexData;
}

@riverpod
Future<TomeLibrarySearchIndexData> tomeLibrarySearchIndex(
  TomeLibrarySearchIndexRef ref,
) async {
  final log = Logger('tomeLibrarySearchIndex');

  final tomeList = await ref.watch(tomeLibraryProvider.future);

  final authorWords = <String, Set<String>>{};
  final titleWords = <String, Set<String>>{};

  for (final tome in tomeList.entries) {
    final author = tome.value.tomeInfo.author ?? '';
    final title = tome.value.tomeInfo.title ?? '';

    final aw = getWordsFromString(author);
    final tw = getWordsFromString(title);

    for (final authorWord in aw) {
      authorWords[authorWord] = {
        ...authorWords[authorWord] ?? [],
        tome.key,
      };
    }

    for (final titleWord in tw) {
      titleWords[titleWord] = {
        ...titleWords[titleWord] ?? [],
        tome.key,
      };
    }
  }

  log.fine(
    '''build(): authorWords: ${authorWords.length} titleWords: ${titleWords.length}''',
  );

  return TomeLibrarySearchIndexData(
    authorWords: authorWords,
    titleWords: titleWords,
  );
}
