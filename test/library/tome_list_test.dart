import 'dart:io';

import 'package:bsr/features/library/tome_library/tome_list/tome_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers/helpers.dart';

void main() {
  ProviderContainer? container;
  group('TomeList', () {
    String getTomeListPath() {
      return join(Directory.systemTemp.path, 'bsr_test_tome_list');
    }

    void createTomeListDirectory() {
      final tomeListPath = getTomeListPath();
      if (!Directory(tomeListPath).existsSync()) {
        Directory(tomeListPath).createSync(recursive: true);
      }
    }

    void deleteTomeListDirectory() {
      final tomeListPath = getTomeListPath();
      if (Directory(tomeListPath).existsSync()) {
        Directory(tomeListPath).deleteSync(recursive: true);
      }
    }

    setUp(() async {
      container = createContainer();
      createTomeListDirectory();
    });

    tearDown(() async {
      container?.dispose();
      container = null;
      deleteTomeListDirectory();
    });

    Future<void> expectEmpty() async {
      await expectLater(
        container!.read(tomeListProvider.future),
        completion(
          {},
        ),
      );
    }

    Future<void> expectOneTome(
      String id,
      String title,
    ) async {
      await expectLater(
        container!.read(tomeListProvider.future),
        completion(
          (Map<String, CachedTome> res) =>
              res.length == 1 && res[id]!.tomeInfo.title == title,
        ),
      );
    }

    Future<void> expectTwoTomes(
      String id0,
      String title0,
      String id1,
      String title1,
    ) async {
      await expectLater(
        container!.read(tomeListProvider.future),
        completion(
          (Map<String, CachedTome> res) =>
              res.length == 2 &&
              res[id0]!.tomeInfo.title == title0 &&
              res[id1]!.tomeInfo.title == title1,
        ),
      );
    }

    Future<void> setDirectory() async {
      await container!.read(tomeListProvider.notifier).setDirectory(
            getTomeListPath(),
          );
    }

    Future<String> addFile(String filePath) async {
      return container!.read(tomeListProvider.notifier).addFile(
            filePath,
          );
    }

    Future<void> remove(String id) async {
      await container!.read(tomeListProvider.notifier).remove(
            id,
          );
    }

    Future<void> clear() async {
      await container!.read(tomeListProvider.notifier).clear();
    }

    test('Instantiate Tomes', () async {
      await expectEmpty();
    });

    test('Open empy directory', () async {
      await setDirectory();

      await expectEmpty();
    });

    test('Open non-existent directory', () async {
      deleteTomeListDirectory();

      await setDirectory();

      await expectEmpty();
    });

    test('Open directory with one tome', () async {
      const id = 'test_id';

      final tomePath = join(
        getTomeListPath(),
        id,
      );

      await Directory(tomePath).create(
        recursive: true,
      );

      final srcFile = File('test/test_tomes/a_novel.fb2');
      final dstFilePath = join(tomePath, '${CachedTome.tomeFilename}.fb2');
      srcFile.copySync(dstFilePath);

      await setDirectory();

      await expectOneTome(id, 'A Novel');
    });

    test('Open directory with two tomes, remove one', () async {
      const ids = ['test_id_0', 'test_id_1'];

      final tomePaths = ids
          .map(
            (id) => join(
              getTomeListPath(),
              id,
            ),
          )
          .toList();

      for (final tomePath in tomePaths) {
        await Directory(tomePath).create(
          recursive: true,
        );
      }

      final srcFiles = [
        File('test/test_tomes/a_novel.epub'),
        File('test/test_tomes/another_novel.epub'),
      ];

      var index = 0;
      final dstFilePaths = srcFiles.map(
        (srcFile) {
          return File(
            join(
              tomePaths[index++],
              '${CachedTome.tomeFilename}.epub',
            ),
          );
        },
      ).toList();

      index = 0;
      for (final srcFile in srcFiles) {
        final dstFilePath = dstFilePaths[index++];
        srcFile.copySync(dstFilePath.path);
      }

      await setDirectory();

      await expectTwoTomes(ids[0], 'A Novel', ids[1], 'Another novel');

      await remove(ids[0]);

      await expectOneTome(ids[1], 'Another novel');
    });

    test('Open empy directory, add one file (epub)', () async {
      final ids = <String>[];

      await setDirectory();

      await expectEmpty();

      ids.add(await addFile('test/test_tomes/a_novel.epub'));

      await expectOneTome(ids[0], 'A Novel');
    });

    test('Open empy directory, add one file (fb2)', () async {
      final ids = <String>[];

      await setDirectory();

      await expectEmpty();

      ids.add(await addFile('test/test_tomes/a_novel.fb2'));

      await expectOneTome(ids[0], 'A Novel');
    });

    test('Open empy directory, add one file (fbz)', () async {
      final ids = <String>[];

      await setDirectory();

      await expectEmpty();

      ids.add(await addFile('test/test_tomes/a_novel.fbz'));

      await expectOneTome(ids[0], 'A Novel');
    });

    test('Open empy directory, add one file (fb2.zip)', () async {
      final ids = <String>[];

      await setDirectory();

      await expectEmpty();

      ids.add(await addFile('test/test_tomes/a_novel.fb2.zip'));

      await expectOneTome(ids[0], 'A Novel');
    });

    test('Open empy directory, add two files, remove one', () async {
      final ids = <String>[];

      await setDirectory();

      await expectEmpty();

      ids.add(await addFile('test/test_tomes/a_novel.epub'));

      await expectOneTome(ids[0], 'A Novel');

      ids.add(await addFile('test/test_tomes/another_novel.epub'));

      await expectTwoTomes(ids[0], 'A Novel', ids[1], 'Another novel');

      await remove(ids[0]);

      await expectOneTome(ids[1], 'Another novel');
    });

    test('Open empy directory, add two files, clear', () async {
      final ids = <String>[];

      await setDirectory();

      await expectEmpty();

      ids
        ..add(await addFile('test/test_tomes/a_novel.epub'))
        ..add(await addFile('test/test_tomes/another_novel.epub'));

      await expectTwoTomes(ids[0], 'A Novel', ids[1], 'Another novel');

      await clear();

      await expectEmpty();

      final listDir = Directory(getTomeListPath());
      final tomeDirs = listDir.list();
      expect(await tomeDirs.isEmpty, true);
    });

    test('Throws DuplicateTome exception', () async {
      final ids = <String>[];

      await setDirectory();

      ids.add(await addFile('test/test_tomes/a_novel.fb2'));

      await expectLater(
        addFile('test/test_tomes/a_novel.fb2'),
        throwsA(
          isA<DuplicateTomeException>(),
        ),
      );

      await expectOneTome(ids[0], 'A Novel');
    });

    test('Open directory with two tome, one broken', () async {
      const ids = ['test_id_0', 'test_id_1'];

      final tomePaths = ids
          .map(
            (id) => join(
              getTomeListPath(),
              id,
            ),
          )
          .toList();

      for (final tomePath in tomePaths) {
        await Directory(tomePath).create(
          recursive: true,
        );
      }

      final srcFiles = [
        File('test/test_tomes/a_novel.epub'),
        File('test/test_tomes/unsupported.format'),
      ];

      var index = 0;
      final dstFilePaths = srcFiles.map(
        (srcFile) {
          return File(
            join(
              tomePaths[index++],
              '${CachedTome.tomeFilename}.epub',
            ),
          );
        },
      ).toList();

      index = 0;
      for (final srcFile in srcFiles) {
        final dstFilePath = dstFilePaths[index++];
        srcFile.copySync(dstFilePath.path);
      }

      final listDir = Directory(getTomeListPath());
      expect(await listDir.list().length, 2);

      await setDirectory();

      await expectOneTome(ids[0], 'A Novel');

      expect(await listDir.list().length, 1);
    });
  });
}
