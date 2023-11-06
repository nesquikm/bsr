import 'package:riverpod/riverpod.dart';

const _debounceDuration = Duration(milliseconds: 500);

extension DebounceAndCancelExtension on Ref {
  Future<void> debounceAndCancel() async {
    var didDispose = false;
    onDispose(() => didDispose = true);

    await Future<void>.delayed(_debounceDuration);

    if (didDispose) {
      throw Exception('Cancelled');
    }
  }
}
