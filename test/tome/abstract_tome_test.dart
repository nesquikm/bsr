import 'package:bsr/features/tome/tome.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbstractTome', () {
    test('Instantiate from epub', () {
      final abstractTome =
          AbstractTome.fromFile('test/test_tomes/a_novel.epub');
      expect(abstractTome, isNotNull);
      expect(abstractTome, isInstanceOf<EpubTome>());
    });

    test('Instantiate from fb2', () {
      final abstractTome = AbstractTome.fromFile('test/test_tomes/a_novel.fb2');
      expect(abstractTome, isNotNull);
      expect(abstractTome, isInstanceOf<FB2Tome>());
    });

    test('Instantiate from fbz', () {
      final abstractTome = AbstractTome.fromFile('test/test_tomes/a_novel.fbz');
      expect(abstractTome, isNotNull);
      expect(abstractTome, isInstanceOf<FB2Tome>());
    });

    test('Instantiate from fb2.zip', () {
      final abstractTome =
          AbstractTome.fromFile('test/test_tomes/a_novel.fb2.zip');
      expect(abstractTome, isNotNull);
      expect(abstractTome, isInstanceOf<FB2Tome>());
    });
  });
}
