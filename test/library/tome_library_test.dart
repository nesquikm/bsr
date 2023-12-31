import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('TomeLibrary', () {
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
  });
}
