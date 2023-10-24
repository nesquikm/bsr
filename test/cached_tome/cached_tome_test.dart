import 'dart:io';

import 'package:bsr/features/cached_tome/cached_tome.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart';
import 'package:path/path.dart';

void main() {
  group('CachedTome', () {
    String getCachedTomePath() {
      return join(Directory.systemTemp.path, 'bsr_test_tome');
    }

    void createCachedDirectory() {
      final cachedTomePath = getCachedTomePath();
      if (!Directory(cachedTomePath).existsSync()) {
        Directory(cachedTomePath).createSync(recursive: true);
      }
    }

    void deleteCachedDirectory() {
      final cachedTomePath = getCachedTomePath();
      if (Directory(cachedTomePath).existsSync()) {
        Directory(cachedTomePath).deleteSync(recursive: true);
      }
    }

    void addTomeFile() {
      final srcFile = File('test/test_tomes/a_novel.fb2');
      final dstFileFath =
          join(getCachedTomePath(), '${CachedTome.tomeFilename}.fb2');
      srcFile.copySync(dstFileFath);
    }

    setUp(() async {
      createCachedDirectory();
    });

    tearDown(() async {
      deleteCachedDirectory();
    });

    test('Instantiate CachedTome', () {
      addTomeFile();

      final tome = CachedTome(getCachedTomePath());
      expect(tome, isNotNull);
    });

    test('Open CachedTome, check for cache files', () async {
      addTomeFile();

      final tome = CachedTome(getCachedTomePath());
      await tome.readInfo();

      final infoFile = File('${getCachedTomePath()}/tome.json');
      expect(infoFile.existsSync(), true);

      final coverFile = File('${getCachedTomePath()}/tome.png');
      expect(coverFile.existsSync(), true);
    });

    test('Open CachedTome, check TomeInfo', () async {
      addTomeFile();

      final tome = CachedTome(getCachedTomePath());
      await tome.readInfo();

      expect(tome.tomeInfo.author, 'Mike Nes');
      expect(tome.tomeInfo.title, 'A Novel');
      expect(tome.tomeInfo.authors, ['Mike Nes']);
    });

    test('Open CachedTome, check cover image', () async {
      addTomeFile();

      final tome = CachedTome(getCachedTomePath());
      await tome.readInfo();

      final coverFile = File('${getCachedTomePath()}/tome.png');
      final image = decodeImage(await coverFile.readAsBytes())!;

      expect(image.height, 612);
      expect(image.width, 396);
    });

    test('Open CachedTome, check cover image', () async {
      addTomeFile();

      final tome = CachedTome(getCachedTomePath());
      await tome.readInfo();

      final coverFile = File(tome.coverImagePath!);
      final image = decodeImage(await coverFile.readAsBytes())!;

      expect(image.height, 612);
      expect(image.width, 396);
    });

    test(
        '''Open CachedTome, empty tome tile, open one more CachedTome, check caches''',
        () async {
      addTomeFile();

      final tome0 = CachedTome(getCachedTomePath());
      await tome0.readInfo();

      File(join(getCachedTomePath(), '${CachedTome.tomeFilename}.fb2'))
          .writeAsBytesSync([], flush: true);

      final tome1 = CachedTome(getCachedTomePath());
      await tome1.readInfo();

      expect(tome1.tomeInfo.author, 'Mike Nes');
      expect(tome1.tomeInfo.title, 'A Novel');
      expect(tome1.tomeInfo.authors, ['Mike Nes']);

      final coverFile = File(tome1.coverImagePath!);
      final image = decodeImage(await coverFile.readAsBytes())!;

      expect(image.height, 612);
      expect(image.width, 396);
    });
  });
}
