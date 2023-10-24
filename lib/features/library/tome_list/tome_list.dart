import 'dart:async';
import 'dart:io';

import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/library/tome_list/cached_tome/cached_tome.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
export 'exceptions.dart';

class TomeList {
  TomeList(this.directoryPath) {
    _log.fine('TomeList($directoryPath)');
  }

  final _log = Logger('TomeList');

  final String directoryPath;

  final Map<String, CachedTome> _cachedTomes = {};

  Future<void> refresh() async {
    _log.fine('refresh()');

    final listDir = Directory(directoryPath);
    await listDir.create(recursive: true);

    final tomeDirs = listDir.list();

    final newTomes = <String, CachedTome>{};
    final openFutureList = <Future<void>>[];

    Future<void> openTome(String tomeDirectoryPath) async {
      final id = basename(tomeDirectoryPath);
      try {
        final tome = _cachedTomes[id] ?? CachedTome(tomeDirectoryPath);
        await tome.readInfo();
        newTomes[id] = tome;
      } catch (e, s) {
        _log.severe('Failed to open tome $id, removing', e, s);
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

    _log.fine('refresh() done, ${_cachedTomes.length} tomes found');
  }

  Future<String> addFile(String filePath) async {
    _log.fine('addFile $filePath');

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

    _log.fine('addFile done, id: $id, original file path: $filePath');

    return id;
  }

  Future<void> remove(String id) async {
    _log.fine('remove $id');

    Directory(join(directoryPath, id)).deleteSync(recursive: true);

    _cachedTomes.remove(id);

    await refresh();

    _log.fine('remove done, id: $id');
  }

  Future<void> clear() async {
    _log.fine('clear');

    Directory(directoryPath).deleteSync(recursive: true);

    _cachedTomes.clear();

    await refresh();

    _log.fine('clear done');
  }

  Map<String, CachedTome> get cachedTomes => _cachedTomes;
}
