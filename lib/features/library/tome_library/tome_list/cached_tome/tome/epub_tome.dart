import 'dart:io';

import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/tome.dart';
import 'package:epubx/epubx.dart';
import 'package:logging/logging.dart';
import 'package:xml/xml.dart';

class EpubTome extends Tome {
  EpubTome(super.filePath);

  final _log = Logger('EpubTome');

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

    _log.fine('get coverImage for $filePath');

    return _epubBookRef!.readCover();
  }

  @override
  Future<TomeContent> get content async {
    assert(_isOpen, 'Should be opened before accessing content');

    _log.fine('get content for $filePath');

    final sectionsFutures = _epubBookRef!.Content?.Html?.entries.map(
          (entry) async {
            final document = XmlDocument.parse(
              await entry.value.readContentAsText(),
            );
            for (final element in document.findAllElements('script')) {
              element.remove();
            }
            return TomeContentSection(
              html:
                  document.findAllElements('body').firstOrNull?.toXmlString() ??
                      '',
            );
          },
        ) ??
        [];

    final sections = await Future.wait(sectionsFutures);

    final images = <String, List<int>>{};

    if (_epubBookRef!.Content?.Images?.entries != null) {
      for (final image in _epubBookRef!.Content!.Images!.entries) {
        final content = await image.value.readContentAsBytes();
        images[image.key] = content;
      }
    }

    return TomeContent(
      sections: sections,
      images: images,
    );
  }

  @override
  Future<void> close() async {
    _isOpen = false;
    _epubBookRef = null;
  }
}
