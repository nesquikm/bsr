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

  TomeContentSection _getSectionFromContent(String? content) {
    final document = XmlDocument.parse(content ?? '');
    for (final element in document.findAllElements('script')) {
      element.remove();
    }
    return TomeContentSection(
      html: document.findAllElements('body').firstOrNull?.toXmlString() ?? '',
    );
  }

  Future<List<TomeContentSection>> _getSectionsFromChapters(
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
      final section = _getSectionFromContent(content);
      sections
        ..add(
          section,
        )
        ..addAll(await _getSectionsFromChapters(chapter.SubChapters));
    }

    return sections;
  }

  Future<List<TomeContentSection>> _getSectionsFromSpineItems() async {
    final spineItems = _epubBookRef!.Schema?.Package?.Spine?.Items;
    final manifestItems = _epubBookRef!.Schema?.Package?.Manifest?.Items;
    if (spineItems == null || manifestItems == null) {
      return [];
    }

    final sections = <TomeContentSection>[];

    for (final spineItem in spineItems) {
      final manifestItem = manifestItems.firstWhere(
        (manifestItem) => manifestItem.Id == spineItem.IdRef,
      );
      final content = await _epubBookRef!.Content?.Html?[manifestItem.Href]
          ?.readContentAsText();
      if (content != null) {
        sections.add(_getSectionFromContent(content));
      }
    }

    return sections;
  }

  @override
  Future<TomeContent> get content async {
    assert(_isOpen, 'Should be opened before accessing content');

    _log.fine('get content for $filePath');

    final chapters = await _epubBookRef!.getChapters();
    var sections = await _getSectionsFromChapters(chapters);

    if (sections.isEmpty) {
      sections = await _getSectionsFromSpineItems();
    }

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
