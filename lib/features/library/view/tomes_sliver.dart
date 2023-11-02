import 'package:bsr/features/library/library.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TomesSliver extends StatelessWidget {
  const TomesSliver({required this.tomes, required this.ref, super.key});

  final Iterable<CachedTome> tomes;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid.builder(
        itemBuilder: (context, index) => TomeCard(
          tome: tomes.elementAt(index),
          ref: ref,
        ),
        itemCount: tomes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 16,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      ),
    );
  }
}
