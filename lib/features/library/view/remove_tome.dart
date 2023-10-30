import 'package:bsr/app/app.dart';
import 'package:bsr/features/library/library.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

Future<void> markTomeAsRemoved({
  required WidgetRef ref,
  required String id,
}) async {
  final log = Logger('removeTome');

  final provider = ref.read(tomeLibraryProvider.notifier);
  final globalContext = GlobalKeys.rootNavigatorKey.currentContext!;

  try {
    await provider.markAsRemoved(id);

    if (!globalContext.mounted) {
      log.severe('Context is not mounted');
      return;
    }

    final l10n = globalContext.l10n;

    await ScaffoldMessenger.of(
      globalContext,
    )
        .showSnackBar(
          SnackBar(
            content: Text(l10n.tomeRemovedMessage),
            action: SnackBarAction(
              label: l10n.undoButtonTitle,
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
    if (!globalContext.mounted) {
      log.severe('Context is not mounted');
      return;
    }
    final l10n = globalContext.l10n;

    ScaffoldMessenger.of(globalContext).showSnackBar(
      SnackBar(
        content: Text(l10n.failedRemoveTomeMessage),
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
  final globalContext = GlobalKeys.rootNavigatorKey.currentContext!;

  try {
    await provider.remove(id);
  } catch (e, s) {
    log.severe('Failed to remove tome $id', e, s);
    if (!globalContext.mounted) {
      log.severe('Context is not mounted');
      return;
    }
    final l10n = globalContext.l10n;
    ScaffoldMessenger.of(globalContext).showSnackBar(
      SnackBar(
        content: Text(l10n.failedRemoveTomeMessage),
      ),
    );
    return;
  }
}
