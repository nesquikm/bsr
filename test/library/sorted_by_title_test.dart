import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('tomeLibrarySortedByTitle', () {
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
  });
}
