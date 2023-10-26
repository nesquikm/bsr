import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

class GlobalObserver extends ProviderObserver {
  final _log = Logger('GlobalObserver');

  bool handleIfError(ProviderBase<Object?> provider, Object? value) {
    if (value is AsyncError) {
      _log.severe('AsyncError in $provider: ${value.error}', value.stackTrace);
      return true;
    }

    return false;
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (handleIfError(provider, value)) {
      return;
    }

    _log.fine('didAddProvider $provider $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _log.fine('didDisposeProvider $provider');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (handleIfError(provider, newValue)) {
      return;
    }

    // _log.fine(
    //   'didUpdateProvider $provider $previousValue -> $newValue',
    // );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _log.severe('providerDidFail $provider', error, stackTrace);
  }
}
