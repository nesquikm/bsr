import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/epub_tome.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/fb2_tome.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/tome_content.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/tome_info.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:image/image.dart';

export 'tome.dart';
export 'tome_content.dart';
export 'tome_info.dart';

abstract class Tome {
  Tome(this.filePath);

  factory Tome.fromFile(String filePath) {
    final filePathLower = filePath.toLowerCase();

    if (_hasExtension(filePathLower, _epubExtensions)) {
      return EpubTome(filePath);
    }

    if (_hasExtension(filePathLower, _fb2Extensions)) {
      return FB2Tome(filePath);
    }
    throw FormatException('Unsupported tome format', filePath);
  }

  final String filePath;

  static const defaultChunkSize = 512 * 1024;

  static List<String> supportedExtensions() {
    return _epubExtensions + _fb2Extensions;
  }

  String getExtenstion() {
    final filePathLower = filePath.toLowerCase();

    return supportedExtensions().firstWhere(
      filePathLower.endsWith,
      orElse: () {
        throw FormatException('Unsupported tome format', filePath);
      },
    );
  }

  static final _epubExtensions = ['.epub'];
  static final _fb2Extensions = ['.fb2', '.fb2.zip', '.fbz'];

  static bool _hasExtension(String filePath, List<String> extensions) {
    final filePathLower = filePath.toLowerCase();
    for (final extension in extensions) {
      if (filePathLower.endsWith(extension)) {
        return true;
      }
    }
    return false;
  }

  Future<void> open();
  Future<void> close();
  TomeInfo get tomeInfo;
  Future<Image?> get coverImage;
  Future<TomeContent> get content;

  Future<String> calcDigest({int chunkSize = Tome.defaultChunkSize}) async {
    final file = File(filePath);
    final reader = ChunkedStreamReader(file.openRead());

    final output = AccumulatorSink<Digest>();
    final input = sha256.startChunkedConversion(output);

    try {
      Uint8List bytes;
      do {
        bytes = await reader.readBytes(chunkSize);
        input.add(bytes);
      } while (bytes.length == chunkSize);
    } finally {
      input.close();
      await reader.cancel();
    }

    return output.events.single.toString();
  }

  static List<int>? base64ToBytes(String? base64Bytes) {
    if (base64Bytes == null) {
      return null;
    }

    return base64Decode(base64Bytes.replaceAll('\n', ''));
  }

  static Image? base64ToImage(String? base64Bytes) {
    final bytes = base64ToBytes(base64Bytes);
    if (bytes == null) {
      return null;
    }

    return decodeImage(bytes);
  }
}
