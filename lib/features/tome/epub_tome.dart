import 'dart:io';

import 'package:bsr/features/tome/tome.dart';
import 'package:epubx/epubx.dart';

class EpubTome extends Tome {
  EpubTome(this.filePath);

  final String filePath;
  late final EpubBookRef _epubBookRef;
  late final TomeInfo _tomeInfo;
  late final Image? _coverImage;
  bool _coverImageCached = false;

  @override
  Future<void> open() async {
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    _epubBookRef = await EpubReader.openBook(bytes);

    _tomeInfo = TomeInfo(
      author: _epubBookRef.Author,
      title: _epubBookRef.Title,
      authors: _epubBookRef.AuthorList?.where(
        (author) => author != null,
      )
          .map(
            (e) => e!,
          )
          .toList(),
    );
  }

  @override
  TomeInfo get tomeInfo => _tomeInfo;

  @override
  Future<Image?> get coverImage async {
    if (_coverImageCached) {
      return _coverImage;
    }

    _coverImage = await _epubBookRef.readCover();
    _coverImageCached = true;
    return _coverImage;
  }
}
