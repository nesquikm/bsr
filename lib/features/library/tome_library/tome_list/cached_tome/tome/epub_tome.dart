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

  Future<List<TomeContentSection>> _getSections(
    List<EpubChapterRef>? chapters,
  ) async {
    if (chapters == null) {
      return [];
    }

    final sections = <TomeContentSection>[];

    for (final chapter in chapters) {
      final content = await _epubBookRef!
          .Content?.Html?[chapter.ContentFileName]
          ?.readContentAsText();
      final document = XmlDocument.parse(content ?? '');
      for (final element in document.findAllElements('script')) {
        element.remove();
      }
      sections
        ..add(
          TomeContentSection(
            html: document.findAllElements('body').firstOrNull?.toXmlString() ??
                '',
          ),
        )
        ..addAll(await _getSections(chapter.SubChapters));
    }

    return sections;
  }

  @override
  Future<TomeContent> get content async {
    assert(_isOpen, 'Should be opened before accessing content');

    _log.fine('get content for $filePath');

    final chapters = await _epubBookRef!.getChapters();

    final sections = await _getSections(chapters);

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
