import 'dart:convert';
import 'dart:io';

import 'package:bsr/features/tome/tome.dart';
import 'package:image/image.dart';
import 'package:path/path.dart';

class CachedTome {
  CachedTome(this.directoryPath);

  static const tomeFilename = 'tome';
  static const _tomeInfoFilename = 'tome.json';
  static const _tomeCoverImageFilename = 'tome.png';

  final String directoryPath;
  late final Tome _tome;
  late final TomeInfo _tomeInfo;
  late final String? _tomeCoverImageFilepath;
  bool _isOpen = false;

  Future<void> open() async {
    if (_isOpen) {
      return;
    }

    final tomeFilePath = await _getTomeFilepath();
    _tome = Tome.fromFile(tomeFilePath);

    final (tomeInfo, fromCache) = await _getTomeInfo();
    _tomeInfo = tomeInfo;

    _tomeCoverImageFilepath = await _getTomeCoverImageFilepath(fromCache);

    _isOpen = true;
  }

  Future<String> _getTomeFilepath() async {
    final possibleFilenames = Tome.supportedExtensions().map(
      (extension) => '$tomeFilename$extension',
    );
    final dir = Directory(directoryPath);
    final file = await dir.list().firstWhere(
      (file) => possibleFilenames.contains(basename(file.path)),
      orElse: () {
        throw Exception('Tome not found');
      },
    );

    return file.path;
  }

  Future<(TomeInfo, bool)> _getTomeInfo() async {
    final filepath = join(directoryPath, _tomeInfoFilename);
    final file = File(filepath);

    if (file.existsSync()) {
      final json = jsonDecode(
        await file.readAsString(),
      ) as Map<String, dynamic>;

      return (TomeInfo.fromJson(json), true);
    }

    await _tome.open();
    final tomeInfo = _tome.tomeInfo;
    final json = jsonEncode(tomeInfo.toJson());
    await file.writeAsString(
      json,
    );

    return (tomeInfo, false);
  }

  Future<String?> _getTomeCoverImageFilepath(bool fromCache) async {
    final filepath = join(directoryPath, _tomeCoverImageFilename);

    if (fromCache) {
      final file = File(filepath);
      return file.existsSync() ? file.path : null;
    }

    await _tome.open();
    final image = await _tome.coverImage;
    if (image == null) {
      return null;
    }
    final png = encodePng(image);
    final file = File(filepath);
    await file.writeAsBytes(png);

    return file.path;
  }

  TomeInfo get tomeInfo => _tomeInfo;
  String? get coverImagePath => _tomeCoverImageFilepath;
}
