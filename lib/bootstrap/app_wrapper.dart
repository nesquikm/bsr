import 'dart:async';

import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/loading/page/loading_page.dart';
import 'package:bsr/features/logger/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({required this.builder, super.key});

  final Widget Function() builder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  late final AppLifecycleListener _listener;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    startAsyncLoaders();
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

  Future<void> startAsyncLoaders() async {
    await startLogging();
    await startRouterPersistence();
    await startTomeLibrary();

    setState(() {
      _loaded = true;
    });
  }

  Future<void> startLogging() async {
    await ref.read(globalLoggerProvider.future);
  }

  Future<void> startLogSession() async {
    await ref.read(globalLoggerProvider).value?.startSession();
  }

  Future<void> startRouterPersistence() async {
    await ref.read(routerPersistenceProvider.future);
  }

  Future<void> startTomeLibrary() async {
    final directoryPath = join(
      (await getApplicationDocumentsDirectory()).path,
      'library',
    );
    // await ref.read(tomeLibraryProvider.notifier).setDirectory(directoryPath);
    // TODO(nesquikm): Yeah, we can't use the above line because of the bug:
    // https://github.com/rrousselGit/riverpod/issues/2041
    await ref.watch(tomeLibraryProvider.notifier).setDirectory(directoryPath);
  }

  @override
  Widget build(BuildContext context) {
    return _loaded ? widget.builder() : const LoadingPage();
  }
}
