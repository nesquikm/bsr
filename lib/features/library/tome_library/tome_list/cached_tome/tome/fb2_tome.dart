import 'package:archive/archive_io.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/tome.dart';
import 'package:crypto/crypto.dart';
import 'package:fb2_parse/fb2_parse.dart';
import 'package:image/image.dart';
import 'package:logging/logging.dart';

class FB2Tome extends Tome {
  FB2Tome(super.filePath);

  final _log = Logger('FB2Tome');

  FB2Book? _fb2Book;
  bool _isOpen = false;

  @override
  Future<void> open() async {
    if (_isOpen) {
      return;
    }

    _fb2Book = FB2Book(filePath);
    await _fb2Book!.parse();

    _isOpen = true;
  }

  @override
  TomeInfo get tomeInfo {
    assert(_isOpen, 'Should be opened before accessing tomeInfo');

    final authors = _fb2Book!.description.authors
        ?.map(
          (author) => [author.firstName, author.middleName, author.lastName]
              .where((part) => part != null && part.isNotEmpty)
              .join(' '),
        )
        .toSet()
        .toList();

    return TomeInfo(
      author: authors?.first,
      title: _fb2Book!.description.bookTitle,
      authors: authors,
    );
  }

  @override
  Future<Image?> get coverImage async {
    assert(_isOpen, 'Should be opened before accessing coverImage');

    _log.fine('get coverImage for $filePath');

    return Tome.base64ToImage(_fb2Book!.description.coverpageImageBytes);
  }

  @override
  Future<TomeContent> get content async {
    assert(_isOpen, 'Should be opened before accessing content');

    _log.fine('get content for $filePath');

    final sections = _fb2Book!.body.sections
            ?.map(
              (section) => TomeContentSection(html: section.content ?? ''),
            )
            .toList() ??
        [];

    final images = Map.fromEntries(
      _fb2Book!.images.map(
        (image) => MapEntry(
          image.name,
          Tome.base64ToBytes(image.bytes)!,
        ),
      ),
    );

    return TomeContent(
      sections: sections,
      images: images,
    );
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
