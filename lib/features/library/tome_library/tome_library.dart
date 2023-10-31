import 'dart:async';
import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'grouped_by_author_sorted_by_title.dart';
export 'sorted_by_title.dart';
export 'tome_library_search_index.dart';
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

  Future<void> setDirectory(String directoryPath) async {
    _log.fine('setDirectory($directoryPath)');
    return ref.read(tomeListProvider.notifier).setDirectory(directoryPath);
  }

  Future<void> refresh() async {
    _log.fine('refresh()');
    await ref.read(tomeListProvider.notifier).refresh();
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

  static LinkedHashMap<String, CachedTome> getSortedByTitle(
    Map<String, CachedTome> tomeList,
  ) {
    final sortedList = tomeList.entries.toList()
      ..sort((a, b) {
        final aTitle = a.value.tomeInfo.title;
        final bTitle = b.value.tomeInfo.title;
        return (aTitle == null || bTitle == null)
            ? 0
            : aTitle.compareTo(bTitle);
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
}
