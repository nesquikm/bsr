import 'package:bsr/app/app.dart';
import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

Future<void> markTomeAsRemoved({
  required WidgetRef ref,
  required String id,
}) async {
  final log = Logger('removeTome');

  final provider = ref.read(tomeLibraryProvider.notifier);
  final context = GlobalKeys.rootNavigatorKey.currentContext!;

  try {
    await provider.markAsRemoved(id);

    if (!context.mounted) {
      log.severe('Context is not mounted');
      return;
    }

    await ScaffoldMessenger.of(
      context,
    )
        .showSnackBar(
          SnackBar(
            content: const Text('Book was removed'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                provider.unmarkAsRemoved(id);
              },
            ),
          ),
        )
        .closed
        .then((reason) {
      switch (reason) {
        case SnackBarClosedReason.action:
          break;
        case SnackBarClosedReason.dismiss:
        case SnackBarClosedReason.swipe:
        case SnackBarClosedReason.hide:
        case SnackBarClosedReason.remove:
        case SnackBarClosedReason.timeout:
          _removeTome(ref: ref, id: id);
      }
    });
  } catch (e, s) {
    log.severe('Failed to remove tome $id', e, s);
    if (!context.mounted) {
      log.severe('Context is not mounted');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to remove book'),
      ),
    );
    return;
  }
}

Future<void> _removeTome({
  required WidgetRef ref,
  required String id,
}) async {
  final log = Logger('removeTome');

  final provider = ref.read(tomeLibraryProvider.notifier);
  final context = GlobalKeys.rootNavigatorKey.currentContext!;

  try {
    await provider.remove(id);
  } catch (e, s) {
    log.severe('Failed to remove tome $id', e, s);
    if (!context.mounted) {
      log.severe('Context is not mounted');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to remove book'),
      ),
    );
    return;
  }

  if (!context.mounted) {
    log.severe('Context is not mounted');
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Book was removed'),
    ),
  );
}
