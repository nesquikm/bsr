import 'dart:io';

import 'package:bsr/features/library/library.dart';
import 'package:collection/collection.dart';
import 'package:io/io.dart';
import 'package:path/path.dart';

String getTomeLibraryPath() {
  return join(Directory.systemTemp.path, 'bsr_test_tome_library');
}

void createTomeLibraryDirectory({bool empty = false}) {
  final tomeLibraryPath = getTomeLibraryPath();
  if (!Directory(tomeLibraryPath).existsSync()) {
    Directory(tomeLibraryPath).createSync(recursive: true);
  }
  if (!empty) {
    copyPathSync('test/test_tomes/library', tomeLibraryPath);
  }
}

void deleteTomeLibraryDirectory() {
  final tomeLibraryPath = getTomeLibraryPath();
  if (Directory(tomeLibraryPath).existsSync()) {
    Directory(tomeLibraryPath).deleteSync(recursive: true);
  }
}

Future<void> createTomeLibraryWithTomes() async {
  const ids = ['id_epub', 'id_fb2'];

  final tomePaths = ids
      .map(
        (id) => join(
          getTomeLibraryPath(),
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
    'test/test_tomes/a_novel.epub',
    'test/test_tomes/a_novel.fb2',
  ];

  final dstFilePaths = srcFiles.mapIndexed(
    (index, srcFile) {
      final extension = Tome.fromFile(srcFile).getExtenstion();
      return File(
        join(
          tomePaths[index++],
          '${CachedTome.tomeFilename}$extension',
        ),
      );
    },
  ).toList();

  var index = 0;
  for (final srcFile in srcFiles) {
    final dstFilePath = dstFilePaths[index++];
    File(srcFile).copySync(dstFilePath.path);
  }
}
