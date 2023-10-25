import 'package:encrypted_storage/encrypted_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_storage.g.dart';

@Riverpod(keepAlive: true)
class GlobalStorage extends _$GlobalStorage {
  static const String _storageFileName = 'bsr_storage.db';

  @override
  Future<EncryptedStorage> build() async {
    final encryptedStorage = EncryptedStorage();

    await encryptedStorage.init(_storageFileName);

    return encryptedStorage;
  }
}
