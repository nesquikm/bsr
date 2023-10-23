import 'package:bsr/features/tome/epub_tome.dart';
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

    test('Calc digest', () async {
      final tome = EpubTome('test/test_tomes/digest_test.txt');
      expect(
        await tome.calcDigest(),
        'ce4e62b68ae006cf657c05b189594996b879f3eb52215d74647d293f6d81c5d9',
      );
      expect(
        await tome.calcDigest(chunkSize: 1),
        'ce4e62b68ae006cf657c05b189594996b879f3eb52215d74647d293f6d81c5d9',
      );
      expect(
        await tome.calcDigest(chunkSize: 2),
        'ce4e62b68ae006cf657c05b189594996b879f3eb52215d74647d293f6d81c5d9',
      );
      expect(
        await tome.calcDigest(chunkSize: 1024 * 1024),
        'ce4e62b68ae006cf657c05b189594996b879f3eb52215d74647d293f6d81c5d9',
      );
    });
  });
}
