import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('TomeLibraryTome', () {
    setUp(() async {
      container = createContainer();
      createTomeLibraryDirectory();
    });

    tearDown(() async {
      container?.dispose();
      container = null;
      deleteTomeLibraryDirectory();
    });

    Future<void> setDirectory() async {
      await container!.read(tomeLibraryProvider.notifier).setDirectory(
            getTomeLibraryPath(),
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

    Future<void> expectTomeWithId(String id) async {
      await expectLater(
        container!.read(tomeLibraryTomeProvider(id).future),
        completion(
          (CachedTome res) => res.id == id,
        ),
      );
    }

    test('All tomes from library is present', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectTomeWithId('id0');
      await expectTomeWithId('id1');
      await expectTomeWithId('id2');
      await expectTomeWithId('id3');
      await expectTomeWithId('id4');
      await expectTomeWithId('id5');
    });

    test('Throws StateError exception when tome is not found', () async {
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(6);
      await expectLater(
        container!.read(tomeLibraryTomeProvider('nonexistent').future),
        throwsA(
          isA<StateError>(),
        ),
      );
    });
  });
}
