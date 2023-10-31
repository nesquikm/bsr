import 'package:flutter/material.dart';

// TODO(nesquikm): It's better to hide FAB when user scrolls down and show it
// when user scrolls up.
class FabAvoidingBottomPadding extends StatelessWidget {
  const FabAvoidingBottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(bottom: 96),
    );
  }
}
