import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/reader/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TomeReaderSections extends StatelessWidget {
  const TomeReaderSections({
    required this.content,
    required this.ref,
    super.key,
  });

  final TomeContent content;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: content.sections.length,
      itemBuilder: (context, index) {
        final section = content.sections[index];
        return TomeReaderSection(
          section: section,
          images: content.images,
          ref: ref,
        );
      },
    );
  }
}
