import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';

class TomeListTile extends StatelessWidget {
  const TomeListTile({required this.tome, super.key});

  final CachedTome tome;

  @override
  Widget build(BuildContext context) {
    final tomeInfo = tome.tomeInfo;

    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(tomeInfo.title ?? ''),
        subtitle: Text(tomeInfo.author ?? ''),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
