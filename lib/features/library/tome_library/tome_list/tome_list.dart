import 'dart:async';
import 'dart:io';

import 'package:bsr/features/library/tome_library/tome_list/cached_tome/cached_tome.dart';
import 'package:bsr/features/library/tome_library/tome_list/exceptions.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'cached_tome/cached_tome.dart';
export 'exceptions.dart';

part 'tome_list.g.dart';

@Riverpod(keepAlive: true)
class TomeList extends _$TomeList {
  final _log = Logger('TomeList');

  String? _directoryPath;

  @override
  Future<Map<String, CachedTome>> build() async {
    return {};
  }

  Future<void> setDirectory(String directoryPath) async {
    _directoryPath = directoryPath;

    await refresh();
  }

  Future<void> refresh() async {
    _log.fine('refresh()');

    _ensureDirectory();

    final listDir = Directory(_directoryPath!);
    await listDir.create(recursive: true);

    final tomeDirs = listDir.list();

    final newTomes = <String, CachedTome>{};
    final openFutureList = <Future<void>>[];

    final prevState = await future;

    Future<void> openTome(String tomeDirectoryPath) async {
      final id = basename(tomeDirectoryPath);
      try {
        final tome = prevState[id] ?? CachedTome(tomeDirectoryPath);
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

    state = AsyncData(newTomes);

    _log.fine('refresh() done, ${newTomes.length} tomes found');
  }

  Future<String> addFile(String filePath) async {
    _log.fine('addFile $filePath');

    _ensureDirectory();

    await refresh();

    final tome = Tome.fromFile(filePath);
    final id = await tome.calcDigest();

    final prevState = await future;

    if (prevState.keys.contains(id)) {
      throw DuplicateTomeException('Book already exists');
    }

    final tomeDirectoryPath = join(_directoryPath!, id);
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

    _ensureDirectory();

    Directory(join(_directoryPath!, id)).deleteSync(recursive: true);

    await refresh();

    _log.fine('remove done, id: $id');
  }

  Future<void> clear() async {
    _log.fine('clear');

    _ensureDirectory();

    Directory(_directoryPath!).deleteSync(recursive: true);

    await refresh();

    _log.fine('clear done');
  }

  void _ensureDirectory() {
    if (_directoryPath == null) {
      throw Exception('Directory not set');
    }
  }
}
