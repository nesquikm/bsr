import 'dart:async';
import 'dart:convert';

import 'package:bsr/app/router/router_persistence/router_persistence_state.dart';
import 'package:bsr/features/storage/storage.dart';
import 'package:encrypted_storage/encrypted_storage.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'router_persistence_state.dart';

part 'router_persistence.g.dart';

@Riverpod(keepAlive: true)
class RouterPersistence extends _$RouterPersistence {
  final _log = Logger('RouterPersistence');

  static const _domain = 'RouterPersistence';
  static const _stateKey = 'state';

  @override
  Future<RouterPersistenceState> build() async {
    final ret = RouterPersistenceState.fromJson(
      jsonDecode(
        await (await _storage).get(
              _stateKey,
              domain: _domain,
            ) ??
            jsonEncode(
              RouterPersistenceState.intial().toJson(),
            ),
      ) as Map<String, dynamic>,
    );

    _log.fine('build() -> $ret');
    return ret;
  }

  Future<void> setState(RouterPersistenceState state) async {
    this.state = AsyncData(state);

    _log.fine('setState($state)');

    unawaited(
      (await _storage).set(
        _stateKey,
        jsonEncode(state.toJson()),
        domain: _domain,
      ),
    );
  }

  RouterPersistenceState getCachedState() {
    final value = state.valueOrNull;
    if (value != null) {
      return value;
    }

    _log.severe('getCachedState(): state is not ready');
    return RouterPersistenceState.intial();
  }

  Future<EncryptedStorage> get _storage =>
      ref.read(globalStorageProvider.future);
}
