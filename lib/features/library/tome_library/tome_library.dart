import 'dart:async';
import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'tome_list/tome_list.dart';

part 'tome_library.g.dart';

@Riverpod(keepAlive: true)
class TomeLibrary extends _$TomeLibrary {
  final _log = Logger('TomeLibrary');

  final Set<String> _markedAsRemoved = {};

  @override
  Future<Map<String, CachedTome>> build() async {
    final tomeList = await ref.watch(tomeListProvider.future);
    return {...tomeList}..removeWhere(
        (key, value) => _markedAsRemoved.contains(key),
      );
  }

  // Future<LinkedHashMap<String, CachedTome>> getSortedByTitle() async {
  //   return _getSortedByTitle(await future);
  // }

  // Future<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>
  //     getGroupedByAuthorAndSortedByTitle() async {
  //   final tomeList = await future;
  //   final result = SplayTreeMap<String, LinkedHashMap<String, CachedTome>>(
  //     (a, b) => a.compareTo(b),
  //   );

  //   for (final tome in tomeList.entries) {
  //     final author = tome.value.tomeInfo.author ?? '';

  //     final authorTomeList = result[author] ?? <String, CachedTome>{}
  //       ..addAll({tome.key: tome.value});

  //     result[author] = _getSortedByTitle(authorTomeList);
  //   }

  //   return result;
  // }

  Future<void> setDirectory(String directoryPath) async {
    _log.fine('setDirectory($directoryPath)');
    return ref.read(tomeListProvider.notifier).setDirectory(directoryPath);
  }

  Future<void> refresh() async {
    _log.fine('refresh()');
    return ref.read(tomeListProvider.notifier).refresh();
  }

  Future<String> addFile(String filePath) async {
    _log.fine('addFile $filePath');
    return ref.read(tomeListProvider.notifier).addFile(filePath);
  }

  Future<void> remove(String id) async {
    _log.fine('remove $id');
    _markedAsRemoved.remove(id);
    return ref.read(tomeListProvider.notifier).remove(id);
  }

  Future<void> clear() async {
    _log.fine('clear');
    return ref.read(tomeListProvider.notifier).clear();
  }

  Future<void> markAsRemoved(String id) async {
    _log.fine('markAsRemoved $id');
    _markedAsRemoved.add(id);
    ref.invalidateSelf();
  }

  Future<void> unmarkAsRemoved(String id) async {
    _log.fine('unmarkAsRemoved $id');
    _markedAsRemoved.remove(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<LinkedHashMap<String, CachedTome>> tomeLibrarySortedByTitle(
  TomeLibrarySortedByTitleRef ref,
) async {
  return _getSortedByTitle(await ref.watch(tomeLibraryProvider.future));
}

@riverpod
Future<SplayTreeMap<String, LinkedHashMap<String, CachedTome>>>
    tomeLibraryGroupedByAuthorAndSortedByTitle(
  TomeLibraryGroupedByAuthorAndSortedByTitleRef ref,
) async {
  final tomeList = await ref.watch(tomeLibraryProvider.future);
  final result = SplayTreeMap<String, LinkedHashMap<String, CachedTome>>(
    (a, b) => a.compareTo(b),
  );

  for (final tome in tomeList.entries) {
    final author = tome.value.tomeInfo.author ?? '';

    final authorTomeList = result[author] ?? <String, CachedTome>{}
      ..addAll({tome.key: tome.value});

    result[author] = _getSortedByTitle(authorTomeList);
  }

  return result;
}

LinkedHashMap<String, CachedTome> _getSortedByTitle(
  Map<String, CachedTome> tomeList,
) {
  final sortedList = tomeList.entries.toList()
    ..sort((a, b) {
      final aTitle = a.value.tomeInfo.title;
      final bTitle = b.value.tomeInfo.title;
      return (aTitle == null || bTitle == null) ? 0 : aTitle.compareTo(bTitle);
    });

  return LinkedHashMap<String, CachedTome>.fromEntries(
    sortedList.map(
      (e) => MapEntry(
        e.key,
        e.value,
      ),
    ),
  );
}
