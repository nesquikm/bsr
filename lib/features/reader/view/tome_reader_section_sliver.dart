import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TomeReaderSectionSliver extends StatelessWidget {
  const TomeReaderSectionSliver({
    required this.content,
    required this.ref,
    super.key,
  });

  final TomeContent content;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text('sections: ${content.sections.length}'),
    );
  }
}
