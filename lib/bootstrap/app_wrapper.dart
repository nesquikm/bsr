import 'dart:async';

import 'package:bsr/features/logger/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({required this.builder, super.key});

  final Widget Function() builder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    startLogger();
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    _listener.dispose();

    super.dispose();
  }

  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        startLogSession();
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> startLogger() async {
    ref.read(globalLoggerProvider);
  }

  Future<void> startLogSession() async {
    await ref.read(globalLoggerProvider).value?.startSession();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }
}
