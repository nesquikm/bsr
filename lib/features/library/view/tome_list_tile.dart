import 'dart:io';

import 'package:bsr/features/library/library.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This is the type used by the popup menu below.
enum _TomeListTilePopupMenuItem { remove }

class TomeListTile extends StatelessWidget {
  const TomeListTile({required this.tome, required this.ref, super.key});

  final CachedTome tome;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final tomeInfo = tome.tomeInfo;

    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 56),
          child: Image.file(
            File(tome.coverImagePath ?? ''),
            fit: BoxFit.contain,
          ),
        ),
        minLeadingWidth: 56,
        title: Text(
          tomeInfo.title ?? l10n.unknownTomeTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: PopupMenuButton<_TomeListTilePopupMenuItem>(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<_TomeListTilePopupMenuItem>>[
            PopupMenuItem<_TomeListTilePopupMenuItem>(
              value: _TomeListTilePopupMenuItem.remove,
              child: Text(l10n.tomeRemoveButtonTitle),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case _TomeListTilePopupMenuItem.remove:
                markTomeAsRemoved(ref: ref, id: tome.id);
            }
          },
        ),
      ),
    );
  }
}
