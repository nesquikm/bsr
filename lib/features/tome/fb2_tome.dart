import 'dart:convert';

import 'package:bsr/features/tome/tome.dart';
import 'package:fb2_parse/fb2_parse.dart';
import 'package:image/image.dart';

class FB2Tome extends AbstractTome {
  FB2Tome(this.filePath);

  final String filePath;
  late final FB2Book _fb2Book;
  late final TomeInfo _tomeInfo;
  late final Image? _coverImage;
  bool _coverImageCached = false;

  @override
  Future<void> open() async {
    _fb2Book = FB2Book(filePath);
    await _fb2Book.parse();

    final authors = _fb2Book.description.authors
        ?.map(
          (author) => [author.firstName, author.middleName, author.lastName]
              .where((part) => part != null && part.isNotEmpty)
              .join(' '),
        )
        .toSet()
        .toList();

    _tomeInfo = TomeInfo(
      author: authors?.first,
      title: _fb2Book.description.bookTitle,
      authors: authors,
    );
  }

  @override
  TomeInfo get tomeInfo => _tomeInfo;

  @override
  Future<Image?> get coverImage async {
    if (_coverImageCached) {
      return _coverImage;
    }

    _coverImage = base64ToImage(_fb2Book.description.coverpageImageBytes);
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
}
