import 'package:bsr/features/tome/epub_tome.dart';
import 'package:bsr/features/tome/fb2_tome.dart';
import 'package:bsr/features/tome/tome_info.dart';
import 'package:image/image.dart';
export 'tome_info.dart';

abstract class Tome {
  Tome();

  factory Tome.fromFile(String filePath) {
    final filePathLower = filePath.toLowerCase();

    if (_hasExtension(filePathLower, epubExtensions)) {
      return EpubTome(filePath);
    }

    if (_hasExtension(filePathLower, fb2Extensions)) {
      return FB2Tome(filePath);
    }

    throw Exception('Unsupported book format');
  }

  static final epubExtensions = ['.epub'];
  static final fb2Extensions = ['.fb2', '.fb2.zip', '.fbz'];

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
  TomeInfo get tomeInfo;
  Future<Image?> get coverImage;
}
