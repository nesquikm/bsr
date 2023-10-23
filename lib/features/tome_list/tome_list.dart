import 'dart:io';

import 'package:bsr/features/cached_tome/cached_tome.dart';
import 'package:bsr/features/tome/tome.dart';
import 'package:path/path.dart';

class TomeList {
  TomeList(this.directoryPath);

  final String directoryPath;

  final Map<String, CachedTome> _cachedTomes = {};

  Future<void> refresh() async {
    final listDir = Directory(directoryPath);
    await listDir.create(recursive: true);

    final tomeDirs = listDir.list();

    final newTomes = <String, CachedTome>{};
    final openFutureList = <Future<void>>[];

    await tomeDirs.forEach(
      (dir) {
        final id = basename(dir.path);
        final tome = _cachedTomes[id] ?? CachedTome(dir.path);
        newTomes[id] = tome;

        final openFuture = tome.open();
        openFutureList.add(openFuture);
      },
    );

    await Future.wait(openFutureList);

    _cachedTomes
      ..clear()
      ..addAll(newTomes);
  }

  Future<String> addFile(String filePath) async {
    final tome = Tome.fromFile(filePath);
    final id = await tome.calcDigest();
    final tomeDirectoryPath = join(directoryPath, id);
    await Directory(tomeDirectoryPath).create(recursive: true);
    final tomeFilePath = join(
      tomeDirectoryPath,
      '${CachedTome.tomeFilename}${extension(filePath)}',
    );

    final file = File(filePath);
    await file.copy(tomeFilePath);
    await refresh();

    return id;
  }

  Future<void> remove(String id) async {
    Directory(join(directoryPath, id)).deleteSync(recursive: true);

    _cachedTomes.remove(id);

    await refresh();
  }

  Future<void> clear() async {
    Directory(directoryPath).deleteSync(recursive: true);

    _cachedTomes.clear();

    await refresh();
  }

  Map<String, CachedTome> get cachedTomes => _cachedTomes;
}
