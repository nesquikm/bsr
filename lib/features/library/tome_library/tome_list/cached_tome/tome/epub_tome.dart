import 'dart:io';

import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/tome.dart';
import 'package:epubx/epubx.dart';

class EpubTome extends Tome {
  EpubTome(super.filePath);

  EpubBookRef? _epubBookRef;
  bool _isOpen = false;

  @override
  Future<void> open() async {
    if (_isOpen) {
      return;
    }

    final file = File(filePath);
    final bytes = await file.readAsBytes();
    _epubBookRef = await EpubReader.openBook(bytes);

    _isOpen = true;
  }

  @override
  TomeInfo get tomeInfo {
    assert(_isOpen, 'Should be opened before accessing tomeInfo');

    return TomeInfo(
      author: _epubBookRef!.Author,
      title: _epubBookRef!.Title,
      authors: _epubBookRef!.AuthorList
          ?.where(
            (author) => author != null,
          )
          .map(
            (e) => e!,
          )
          .toList(),
    );
  }

  @override
  Future<Image?> get coverImage async {
    assert(_isOpen, 'Should be opened before accessing coverImage');

    return _epubBookRef!.readCover();
  }

  @override
  Future<void> close() async {
    _isOpen = false;
    _epubBookRef = null;
  }
}
