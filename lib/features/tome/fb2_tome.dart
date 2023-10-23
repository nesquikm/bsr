import 'dart:convert';

import 'package:archive/archive_io.dart';
import 'package:bsr/features/tome/tome.dart';
import 'package:crypto/crypto.dart';
import 'package:fb2_parse/fb2_parse.dart';
import 'package:image/image.dart';

class FB2Tome extends Tome {
  FB2Tome(super.filePath);

  FB2Book? _fb2Book;
  late final TomeInfo _tomeInfo;
  late final Image? _coverImage;
  bool _coverImageCached = false;
  bool _isOpen = false;

  @override
  Future<void> open() async {
    if (_isOpen) {
      return;
    }

    _fb2Book = FB2Book(filePath);
    await _fb2Book!.parse();

    final authors = _fb2Book!.description.authors
        ?.map(
          (author) => [author.firstName, author.middleName, author.lastName]
              .where((part) => part != null && part.isNotEmpty)
              .join(' '),
        )
        .toSet()
        .toList();

    _tomeInfo = TomeInfo(
      author: authors?.first,
      title: _fb2Book!.description.bookTitle,
      authors: authors,
    );

    _isOpen = true;
  }

  @override
  TomeInfo get tomeInfo => _tomeInfo;

  @override
  Future<Image?> get coverImage async {
    if (_coverImageCached) {
      return _coverImage;
    }

    await open();

    _coverImage = base64ToImage(_fb2Book!.description.coverpageImageBytes);
    _coverImageCached = true;
    return _coverImage;
  }

  Image? base64ToImage(String? base64Bytes) {
    if (base64Bytes == null) {
      return null;
    }

    final bytes = base64Decode(base64Bytes.replaceAll('\n', ''));
    final image = decodeImage(bytes);

    return image;
  }

  @override
  Future<String> calcDigest({int chunkSize = Tome.defaultChunkSize}) async {
    final pathLower = filePath.toLowerCase();
    if (!pathLower.endsWith('.fbz') && !pathLower.endsWith('.fb2.zip')) {
      return super.calcDigest(chunkSize: chunkSize);
    }

    final inputStream = InputFileStream(filePath);
    final archive = ZipDecoder().decodeBuffer(inputStream);
    final compressed = archive.files
        .firstWhere((file) => file.name.toLowerCase().endsWith('.fb2'));
    final decopressed = compressed.content as List<int>;
    final output = sha256.convert(decopressed);
    await inputStream.close();

    return output.toString();
  }

  @override
  Future<void> close() async {
    _isOpen = false;
    _fb2Book = null;
  }
}
