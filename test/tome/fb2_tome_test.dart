import 'package:bsr/features/library/tome_list/cached_tome/tome/fb2_tome.dart';
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

    test('Calc digest', () async {
      final tome = FB2Tome('test/test_tomes/digest_test.txt');
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

    test('Calc digest for compressed file', () async {
      final tomeFb2Zip = FB2Tome('test/test_tomes/digest_test.fb2.zip');
      expect(
        await tomeFb2Zip.calcDigest(),
        'ce4e62b68ae006cf657c05b189594996b879f3eb52215d74647d293f6d81c5d9',
      );

      final tomeFbz = FB2Tome('test/test_tomes/digest_test.fbz');
      expect(
        await tomeFbz.calcDigest(),
        'ce4e62b68ae006cf657c05b189594996b879f3eb52215d74647d293f6d81c5d9',
      );
    });

    test('Calc digest for compressed file (actual)', () async {
      final expected = await tome!.calcDigest();

      final tomeFb2Zip = FB2Tome('test/test_tomes/a_novel.fb2.zip');
      expect(
        await tomeFb2Zip.calcDigest(),
        expected,
      );

      final tomeFbz = FB2Tome('test/test_tomes/a_novel.fbz');
      expect(
        await tomeFbz.calcDigest(),
        expected,
      );
    });
  });
}
