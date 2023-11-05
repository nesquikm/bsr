import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('tomeLibraryGroupedByAuthorAndSortedByTitle', () {
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

    test('Check GroupedByAuthorAndSortedByTitle', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(
          tomeLibraryGroupedByAuthorAndSortedByTitleProvider(
            const TomeLibrarySearchData.everywhere(''),
          ).future,
        ),
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
