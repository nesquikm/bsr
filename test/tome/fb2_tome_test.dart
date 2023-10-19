import 'package:bsr/features/tome/fb2_tome.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FB2Tome', () {
    FB2Tome? tome;

    setUp(() async {
      tome = FB2Tome('test/test_tomes/a_novel.fb2');
    });

    tearDown(() async {
      tome = null;
    });

    test('Instantiate FB2Tome', () {
      expect(tome, isNotNull);
    });

    test('Open existing fb2 file', () async {
      await tome!.open();
      expect(tome!.tomeInfo.author, 'Mike Nes');
      expect(tome!.tomeInfo.title, 'A Novel');
      expect(tome!.tomeInfo.authors, ['Mike Nes']);
      expect(await tome!.coverImage, isNotNull);
      expect((await tome!.coverImage)!.width, 396);
      expect((await tome!.coverImage)!.height, 612);
    });

    test('Open existing fb2.zip file', () async {
      final tomeZip = FB2Tome('test/test_tomes/a_novel.fb2.zip');

      await tomeZip.open();
      expect(tomeZip.tomeInfo.author, 'Mike Nes');
      expect(tomeZip.tomeInfo.title, 'A Novel');
      expect(tomeZip.tomeInfo.authors, ['Mike Nes']);
      expect(await tomeZip.coverImage, isNotNull);
      expect((await tomeZip.coverImage)!.width, 396);
      expect((await tomeZip.coverImage)!.height, 612);

      await tome!.open();
      expect((await tomeZip.coverImage)!.data, (await tome!.coverImage)!.data);
    });
  });
}
