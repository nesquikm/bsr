import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This is the type used by the popup menu below.
// enum _TomeListTilePopupMenuItem { remove }

class TomeListTileCard extends StatelessWidget {
  const TomeListTileCard({required this.tome, required this.ref, super.key});

  final CachedTome tome;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    // final tomeInfo = tome.tomeInfo;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: TomeListTile(tome: tome, ref: ref),
    );
  }
}
