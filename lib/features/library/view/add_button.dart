import 'package:bsr/features/library/library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget addFABButton({
  required WidgetRef ref,
}) {
  return FloatingActionButton(
    onPressed: () {
      addFile(
        ref: ref,
      );
    },
    child: const Icon(Icons.add),
  );
}
