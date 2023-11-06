import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('tomeLibrarySearch', () {
    setUp(() async {
      container = createContainer();
      createTomeLibraryDirectory();
    });

    tearDown(() async {
      container?.dispose();
      container = null;
      deleteTomeLibraryDirectory();
    });

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

    test('filterSearchIndex', () async {
      final word0 = {
        'word0': {
          'id0',
          'id1',
        },
      };
      final word1 = {
        'word1': {
          'id1',
          'id2',
        },
      };
      final word2 = {
        'word2': {
          'id0',
          'id1',
          'id2',
        },
      };

      final cacodemon = {
        'cacodemon': {
          'id0',
        },
      };

      final cactus = {
        'cactus': {
          'id1',
        },
      };

      final index = {...word0, ...word1, ...word2, ...cacodemon, ...cactus};

      expect(
        filterSearchIndex(
          index,
          '',
        ),
        {'id0', 'id1', 'id2'},
      );

      expect(
        filterSearchIndex(
          index,
          'word0',
        ),
        {'id0', 'id1'},
      );

      expect(
        filterSearchIndex(
          index,
          'word1',
        ),
        {'id1', 'id2'},
      );

      expect(
        filterSearchIndex(
          index,
          'word2',
        ),
        {'id0', 'id1', 'id2'},
      );

      expect(
        filterSearchIndex(
          index,
          'cacodemon',
        ),
        {'id0'},
      );

      expect(
        filterSearchIndex(
          index,
          'cactus',
        ),
        {'id1'},
      );

      expect(
        filterSearchIndex(
          index,
          'cac',
        ),
        {'id0', 'id1'},
      );

      expect(
        filterSearchIndex(
          index,
          'cac word',
        ),
        {'id0', 'id1'},
      );

      expect(
        filterSearchIndex(
          index,
          'cac word1',
        ),
        {'id1'},
      );
    });

    test('Check filtered results: authors', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.authors('author1'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, {'id1', 'id3', 'id4'});
            return true;
          },
        ),
      );
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.authors('author'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, {'id0', 'id1', 'id2', 'id3', 'id4', 'id5'});
            return true;
          },
        ),
      );
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.authors('nonexistent'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, <String>{});
            return true;
          },
        ),
      );
    });

    test('Check filtered results: authors, complex', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.authors('nonexistent author'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, <String>{});
            return true;
          },
        ),
      );
    });

    test('Check filtered results: titles', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.titles('someTitle1'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, {'id1', 'id2'});
            return true;
          },
        ),
      );
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.titles('someTitle0'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, {'id0', 'id1', 'id2', 'id3', 'id4', 'id5'});
            return true;
          },
        ),
      );
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.titles('nonexistent'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, <String>{});
            return true;
          },
        ),
      );
    });

    test('Check filtered results: titles, complex', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(
          tomeLibrarySearchProvider(
            const TomeLibrarySearchData.titles('someTitle0 nonexistent'),
          ).future,
        ),
        completion(
          (Map<String, CachedTome> res) {
            expect(res.keys, <String>{});
            return true;
          },
        ),
      );
    });
  });
}
