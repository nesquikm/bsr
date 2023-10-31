import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('tomeLibrarySearchIndex', () {
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

    test('getWordsFromString', () async {
      expect(getWordsFromString('hello world'), {'hello', 'world'});
      expect(getWordsFromString('hello.world'), {'hello.world'});
    });

    test('Check sorting by title', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(tomeLibrarySearchIndexProvider.future),
        completion(
          (TomeLibrarySearchIndexData res) {
            expect(res.authorWords, {
              'author0': {'id5'},
              'author1': {'id1', 'id3', 'id4'},
              'author2': {'id0', 'id2'},
            });
            expect(res.titleWords, {
              'title0': {'id0'},
              'title1': {'id1'},
              'title2': {'id2'},
              'title3': {'id3'},
              'title4': {'id4'},
              'title5': {'id5'},
              '0': {'id4'},
              '1': {'id2'},
              '2': {'id5'},
              '3': {'id1'},
              '4': {'id3'},
              '5': {'id0'},
              'sometitle0': {'id0', 'id1', 'id2', 'id3', 'id4', 'id5'},
              'sometitle1': {'id1', 'id2'},
            });
            return true;
          },
        ),
      );
    });
  });
}
