import 'package:bsr/features/tome/tome.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EpubTome', () {
    EpubTome? tome;

    setUp(() async {
      tome = EpubTome('test/test_tomes/a_novel.epub');
    });

    tearDown(() async {
      tome = null;
    });

    test('Instantiate EpubTome', () {
      expect(tome, isNotNull);
    });

    test('Open existing file', () async {
      await tome!.open();
      expect(tome!.tomeInfo.author, 'Mike Nes');
      expect(tome!.tomeInfo.title, 'A Novel');
      expect(tome!.tomeInfo.authors, ['Mike Nes']);
      expect(await tome!.coverImage, isNotNull);
      expect((await tome!.coverImage)!.width, 396);
      expect((await tome!.coverImage)!.height, 612);
    });
  });
}
