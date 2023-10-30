import 'dart:io';

import 'package:bsr/features/library/library.dart';
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
    final tomeInfo = tome.tomeInfo;

    return Card(
      child: ListTile(
        dense: false,
        leading: SizedBox.square(
          dimension: 56,
          child: Image.file(
            File(tome.coverImagePath ?? ''),
            fit: BoxFit.contain,
          ),
        ),
        title: Text(tomeInfo.title ?? ''),
        subtitle: Text(tomeInfo.author ?? ''),
        trailing: PopupMenuButton<_TomeListTilePopupMenuItem>(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<_TomeListTilePopupMenuItem>>[
            const PopupMenuItem<_TomeListTilePopupMenuItem>(
              value: _TomeListTilePopupMenuItem.remove,
              child: Text('Remove'),
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
