import 'dart:async';
import 'dart:io';

import 'package:bsr/features/cached_tome/cached_tome.dart';
import 'package:bsr/features/tome/tome.dart';
import 'package:bsr/features/tome_list/exceptions.dart';
import 'package:path/path.dart';
export 'exceptions.dart';

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

    Future<void> openTome(String tomeDirectoryPath) async {
      final id = basename(tomeDirectoryPath);
      try {
        final tome = _cachedTomes[id] ?? CachedTome(tomeDirectoryPath);
        await tome.open();
        newTomes[id] = tome;
        await tome.close();
      } catch (_) {
        await remove(id);
      }
    }

    await tomeDirs.forEach(
      (dir) {
        openFutureList.add(openTome(dir.path));
      },
    );

    await Future.wait(openFutureList);

    _cachedTomes
      ..clear()
      ..addAll(newTomes);
  }

  Future<String> addFile(String filePath) async {
    await refresh();

    final tome = Tome.fromFile(filePath);
    final id = await tome.calcDigest();

    if (_cachedTomes.keys.contains(id)) {
      throw DuplicateTomeException('Book already exists');
    }

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
