import 'dart:io';

import 'package:bsr/features/library/tome_list/cached_tome/cached_tome.dart';
import 'package:bsr/features/library/tome_list/tome_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';

void main() {
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

    void deleteTimeListDirectory() {
      final tomeListPath = getTomeListPath();
      if (Directory(tomeListPath).existsSync()) {
        Directory(tomeListPath).deleteSync(recursive: true);
      }
    }

    setUp(() async {
      createTomeListDirectory();
    });

    tearDown(() async {
      deleteTimeListDirectory();
    });

    test('Instantiate TomeList', () {
      final tomeList = TomeList(getTomeListPath());
      expect(tomeList, isNotNull);
    });

    test('Open empy directory', () async {
      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.isEmpty, true);
    });

    test('Open non-existent directory', () async {
      deleteTimeListDirectory();

      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.isEmpty, true);
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

      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.length, 1);
      expect(tomeList.cachedTomes[id]!.tomeInfo.title, 'A Novel');
    });

    test('Open directory with two tome, remove one', () async {
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
      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.length, 2);
      expect(tomeList.cachedTomes[ids[0]]!.tomeInfo.title, 'A Novel');
      expect(tomeList.cachedTomes[ids[1]]!.tomeInfo.title, 'Another novel');

      await tomeList.remove(ids[0]);

      expect(tomeList.cachedTomes.length, 1);
      expect(tomeList.cachedTomes[ids[1]]!.tomeInfo.title, 'Another novel');
    });

    test('Open empy directory, add two files, remove one', () async {
      final ids = <String>[];

      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.isEmpty, true);

      ids.add(await tomeList.addFile('test/test_tomes/a_novel.epub'));

      expect(tomeList.cachedTomes.length, 1);

      ids.add(await tomeList.addFile('test/test_tomes/another_novel.epub'));

      expect(tomeList.cachedTomes.length, 2);

      expect(tomeList.cachedTomes[ids[0]]!.tomeInfo.title, 'A Novel');
      expect(tomeList.cachedTomes[ids[1]]!.tomeInfo.title, 'Another novel');

      await tomeList.remove(ids[0]);
      expect(tomeList.cachedTomes.length, 1);
      expect(tomeList.cachedTomes[ids[1]]!.tomeInfo.title, 'Another novel');
    });

    test('Open empy directory, add two files, clear', () async {
      final ids = <String>[];

      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.isEmpty, true);

      ids
        ..add(await tomeList.addFile('test/test_tomes/a_novel.epub'))
        ..add(await tomeList.addFile('test/test_tomes/another_novel.epub'));

      expect(tomeList.cachedTomes.length, 2);

      await tomeList.clear();

      expect(tomeList.cachedTomes.isEmpty, true);

      final listDir = Directory(getTomeListPath());
      final tomeDirs = listDir.list();
      expect(await tomeDirs.isEmpty, true);
    });

    test('Throws DuplicateTome exception', () async {
      final ids = <String>[];

      final tomeList = TomeList(getTomeListPath());

      ids.add(await tomeList.addFile('test/test_tomes/a_novel.fb2'));
      await expectLater(
        () async => tomeList.addFile('test/test_tomes/a_novel.fb2.zip'),
        throwsA(isA<DuplicateTomeException>()),
      );

      expect(tomeList.cachedTomes.length, 1);
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

      final tomeList = TomeList(getTomeListPath());
      await tomeList.refresh();

      expect(tomeList.cachedTomes.length, 1);
      expect(tomeList.cachedTomes[ids[0]]!.tomeInfo.title, 'A Novel');

      expect(await listDir.list().length, 1);
    });
  });
}
