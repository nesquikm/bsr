import 'dart:io';

import 'package:riverpod/riverpod.dart';

const _debounceDuration = Duration(milliseconds: 500);

extension DebounceAndCancelExtension on Ref {
  Future<void> debounceAndCancel() async {
    // Do not debounce during tests
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return;
    }

    var didDispose = false;
    onDispose(() => didDispose = true);

    await Future<void>.delayed(_debounceDuration);

    if (didDispose) {
      throw Exception('Cancelled');
    }
  }
}
