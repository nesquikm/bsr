import 'dart:async';

import 'package:bsr/bootstrap/bootstrap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

Future<void> bootstrap(Widget Function() builder) async {
  final log = Logger('bootstrap');

  FlutterError.onError = (details) {
    log.severe(details.exceptionAsString(), details, details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log.severe(null, error, stack);

    return true;
  };

  runApp(
    ProviderScope(
      observers: [
        GlobalObserver(),
      ],
      child: AppWrapper(builder: builder),
    ),
  );
}
