import 'package:bsr/features/library/library.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('TomeLibraryTomeContent', () {
    setUp(() async {
      container = createContainer();
      createTomeLibraryDirectory(empty: true);
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

    Future<void> expectTomeWithIdHasContent(String id) async {
      await expectLater(
        container!.read(tomeLibraryTomeContentProvider(id).future),
        completion(
          (TomeContent res) => res.sections.isNotEmpty,
        ),
      );
    }

    test('All tomes from library is present', () async {
      await createTomeLibraryWithTomes();
      await setDirectory();
      // TODO(nesquikm): why do we need to call this?
      await expectTomeCount(2);
      await expectTomeWithIdHasContent('id_epub');
      await expectTomeWithIdHasContent('id_fb2');
    });
  });
}
