import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/epub_tome.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/fb2_tome.dart';
import 'package:bsr/features/library/tome_library/tome_list/cached_tome/tome/tome.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tome', () {
    test('Instantiate from epub', () {
      final tome = Tome.fromFile('test/test_tomes/a_novel.epub');
      expect(tome, isNotNull);
      expect(tome, isInstanceOf<EpubTome>());
    });

    test('Instantiate from fb2', () {
      final tome = Tome.fromFile('test/test_tomes/a_novel.fb2');
      expect(tome, isNotNull);
      expect(tome, isInstanceOf<FB2Tome>());
    });

    test('Instantiate from fbz', () {
      final tome = Tome.fromFile('test/test_tomes/a_novel.fbz');
      expect(tome, isNotNull);
      expect(tome, isInstanceOf<FB2Tome>());
    });

    test('Instantiate from fb2.zip', () {
      final tome = Tome.fromFile('test/test_tomes/a_novel.fb2.zip');
      expect(tome, isNotNull);
      expect(tome, isInstanceOf<FB2Tome>());
    });

    test('Throws FormatException for unsupported file', () {
      expect(
        () => Tome.fromFile('test/test_tomes/unsupported.format'),
        throwsFormatException,
      );
    });
  });
}
