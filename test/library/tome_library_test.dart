import 'dart:io';

import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:io/io.dart';
import 'package:path/path.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('TomeLibrary', () {
    String getTomeLibraryPath() {
      return join(Directory.systemTemp.path, 'bsr_test_tome_library');
    }

    void createTomeLibraryDirectory() {
      final tomeLibraryPath = getTomeLibraryPath();
      if (!Directory(tomeLibraryPath).existsSync()) {
        Directory(tomeLibraryPath).createSync(recursive: true);
      }
      copyPathSync('test/test_tomes/library', tomeLibraryPath);
    }

    void deleteTomeLibraryDirectory() {
      final tomeLibraryPath = getTomeLibraryPath();
      if (Directory(tomeLibraryPath).existsSync()) {
        Directory(tomeLibraryPath).deleteSync(recursive: true);
      }
    }

    setUp(() async {
      container = createContainer();
      createTomeLibraryDirectory();
    });

    tearDown(() async {
      container?.dispose();
      container = null;
      deleteTomeLibraryDirectory();
    });

    Future<void> expectEmpty() async {
      await expectLater(
        container!.read(tomeLibraryProvider.future),
        completion(
          {},
        ),
      );
    }

    Future<void> expectTomeCount(int count) async {
      await expectLater(
        container!.read(tomeLibraryProvider.future),
        completion(
          (Map<String, CachedTome> res) => res.length == count,
        ),
      );
    }

    Future<void> setDirectory() async {
      await container!.read(tomeLibraryProvider.notifier).setDirectory(
            getTomeLibraryPath(),
          );
    }

    Future<void> markAsRemoved(String id) async {
      await container!.read(tomeLibraryProvider.notifier).markAsRemoved(
            id,
          );
    }

    Future<void> unmarkAsRemoved(String id) async {
      await container!.read(tomeLibraryProvider.notifier).unmarkAsRemoved(
            id,
          );
    }

    test('Instantiate TomeLibrary', () async {
      await expectEmpty();
    });

    test('Instantiate TomeLibrary with library', () async {
      await setDirectory();
      await expectTomeCount(6);
    });

    test('Mark and unmark tome as removed', () async {
      await setDirectory();
      await expectTomeCount(6);
      await markAsRemoved('id3');
      await expectTomeCount(5);
      await unmarkAsRemoved('id3');
      await expectTomeCount(6);
    });

    test('Check sorting by title', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(tomeLibrarySortedByTitleProvider.future),
        completion(
          (Map<String, CachedTome> res) {
            final values = res.values.toList();
            for (var i = 0; i < 5; i++) {
              if (!values[i].tomeInfo.title!.startsWith('$i')) {
                return false;
              }
            }
            return true;
          },
        ),
      );
    });

    test('Check GroupedByAuthorAndSortedByTitle', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!
            .read(tomeLibraryGroupedByAuthorAndSortedByTitleProvider.future),
        completion(
          (Map<String, Map<String, CachedTome>> res) {
            final authors = res.keys.toList();

            expect(authors, ['author0', 'author1', 'author2']);

            final author0 = res['author0']!.keys.toList();
            expect(author0, ['id5']);

            final author1 = res['author1']!.keys.toList();
            expect(author1, ['id4', 'id1', 'id3']);

            final author2 = res['author2']!.keys.toList();
            expect(author2, ['id2', 'id0']);

            return true;
          },
        ),
      );
    });
  });
}
